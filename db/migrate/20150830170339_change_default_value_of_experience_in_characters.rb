class ChangeDefaultValueOfExperienceInCharacters < ActiveRecord::Migration
  def change
    remove_column :characters, :experience, :integer
    add_column :characters, :experience, :integer, :default => 0
  end
end
