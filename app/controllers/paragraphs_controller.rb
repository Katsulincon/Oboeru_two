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
  end

  private

  def paragraph_params
    params.require(:paragraph).permit(:name, :sentence)

  end
end
