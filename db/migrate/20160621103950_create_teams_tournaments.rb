class CreateTeamsTournaments < ActiveRecord::Migration
  def change
    create_table :teams_tournaments, id: false do |t|
      t.integer :team_id
      t.integer :tournament_id
    end
  end
end
