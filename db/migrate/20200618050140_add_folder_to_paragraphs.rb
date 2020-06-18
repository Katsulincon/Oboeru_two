class AddFolderToParagraphs < ActiveRecord::Migration[6.0]
  def change
    add_reference :paragraphs, :folder, null: false, foreign_key: true
  end
end
