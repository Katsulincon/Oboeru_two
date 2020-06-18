class FoldersController < ApplicationController
  def index
    @folders = Folder.all
  end
end
