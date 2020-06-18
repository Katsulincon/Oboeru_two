class AddNameToParagraphs < ActiveRecord::Migration[6.0]
  def change
    add_column :paragraphs, :name, :string
  end
end
