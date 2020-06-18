class CreateBlanks < ActiveRecord::Migration[6.0]
  def change
    create_table :blanks do |t|
      t.integer :first_index
      t.integer :end_index
      t.references :paragraph, null: false, foreign_key: true

      t.timestamps
    end
  end
end
