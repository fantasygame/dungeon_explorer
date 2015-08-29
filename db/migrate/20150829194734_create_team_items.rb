class CreateTeamItems < ActiveRecord::Migration
  def change
    create_table :team_items do |t|
      t.belongs_to :team
      t.belongs_to :item

      t.timestamps null: false
    end
  end
end
