class FoldersController < ApplicationController
  def index
    @folders = policy_scope(Folder)
    # might have to change folder_policy
  end

  def new
    @folder = Folder.new
    authorize @folder
  end

  def create
    @folder = Folder.new(folder_params)
    @folder.user = current_user
    authorize @folder

    if @folder.save
      redirect_to folders_path
    else
      render :new
    end
  end

  def show
    @folder = Folder.find(params[:id])
    @paragraph = Paragraph.new
    # authorize @paragraph
    authorize @folder
  end

  private

  def folder_params
    params.require(:folder).permit(:name)
  end
end
