require 'rails_helper'

describe User do

  let(:user) { build(:user) }
  let(:team) { build(:team) }
  let(:teams){ create_list(:team, 5) }
  
  describe '#player_limit' do
    
    it 'if users number above 5' do
      user.teams << teams
      expect{ user.teams << team }.to raise_exception ActiveRecord::Rollback
    end
    
    it 'if users number below or equal 5' do
      expect{ user.teams << teams }.not_to raise_exception
    end
    
  end

end
