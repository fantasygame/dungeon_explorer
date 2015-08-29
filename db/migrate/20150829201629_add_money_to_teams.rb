class AddMoneyToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :money, :integer, default: 0
  end
end
