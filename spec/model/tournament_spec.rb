require 'rails_helper'

describe Tournament do
  
  let(:tournament) { build(:tournament) }
  let(:teams)      { create_list(:team, 3) }
  let(:team)       { create(:team) }
  
  describe ".before_add" do

    it '#team_dublicate' do
      tournament.teams << team
      expect{ tournament.teams << team }.to raise_exception ActiveRecord::Rollback
    end
   
    it '#team_limit' do
      tournament = build(:tournament, max_team: 2)
      expect{ tournament.teams << teams }.to raise_exception ActiveRecord::Rollback
    end
    
  end
  
end