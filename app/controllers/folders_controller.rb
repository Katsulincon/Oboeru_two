class FoldersController < ApplicationController
  def index
    @folders = policy_scope(Folder)
    # might have to change folder_policy
  end
end
