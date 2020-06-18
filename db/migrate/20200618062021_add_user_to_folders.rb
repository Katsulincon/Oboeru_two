class AddUserToFolders < ActiveRecord::Migration[6.0]
  def change
    add_reference :folders, :user, null: false, foreign_key: true
  end
end
