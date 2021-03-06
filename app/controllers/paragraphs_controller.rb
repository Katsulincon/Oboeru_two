class ParagraphsController < ApplicationController
  def index

  end


  def create
    @paragraph = Paragraph.new(paragraph_params)
    @folder = Folder.find(params[:folder_id])
    @paragraph.folder = @folder
    authorize @paragraph
    authorize @folder
    # userはいらない??
    if @paragraph.save
      # blanks#newへ移動
      redirect_to new_folder_paragraph_blank_path(@folder, @paragraph)
    else
      render 'folders/show'
    end
  end

  def show
    @paragraph = Paragraph.find(params[:id])
    authorize @paragraph

    letter_array = @paragraph.sentence.split('')
    @blanks = @paragraph.blanks
    blank_num = 1

    @blanks.each do |blank|
      blank_range = (blank.first_index..blank.end_index).to_a #[3, 4, 5, 6]

      blank_range.each do |index|
        letter_array[index] = '_'
      end
      letter_array[blank_range[0]] = " (#{blank_num.to_s})"
      blank_num += 1
    end
    @practice_paragraph = letter_array.join

  end

  def edit
    @paragraph = Paragraph.find(params[:id])
    @folder = Folder.find(params[:folder_id])
    authorize @paragraph
  end

  def update
    @paragraph = Paragraph.find(params[:id])
    @paragraph.name = params[:paragraph][:name]
    authorize @paragraph
    if @paragraph.save
      redirect_to folder_paragraph_path(@paragraph.folder, @paragraph)
    else
      raise
      render :edit
    end
  end

  def destroy
    paragraph = Paragraph.find(params[:id])
    authorize paragraph
    paragraph.blanks.destroy_all
    paragraph.delete
    redirect_to folder_path(paragraph.folder)
  end


  private

  def paragraph_params
    params.require(:paragraph).permit(:name, :sentence)

  end
end
