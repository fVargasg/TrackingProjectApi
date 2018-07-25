class CreateStories < ActiveRecord::Migration[5.1]
  def change
    create_table :stories do |t|
      t.string :name
      t.string :description
      t.string :typestory
      t.string :difficulty
      t.references :project, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
