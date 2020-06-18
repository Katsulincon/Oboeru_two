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
      # redirect_to folder_path(@folder)
      redirect_to new_folder_paragraph_blank_path(@paragraph, @folder)
    else
      render 'folders/show'
      raise
    end


  end

  private

  def paragraph_params
    params.require(:paragraph).permit(:name, :sentence)

  end
end
