class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :experience
      t.belongs_to :team, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
