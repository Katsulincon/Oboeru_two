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
      redirect_to folder_path(@folder)
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

  def edit
    @folder = Folder.find(params[:id])
    authorize @folder
  end

  def update
    @folder = Folder.find(params[:id])
    @folder.name = params[:folder][:name]
    authorize @folder

    if @folder.save
      redirect_to folder_path(@folder)
    else
      render :edit
    end
  end

  def destroy
    @folder = Folder.find(params[:id])
    authorize @folder
    @folder.destroy
    redirect_to folders_path
  end

  private

  def folder_params
    params.require(:folder).permit(:name)
  end
end
