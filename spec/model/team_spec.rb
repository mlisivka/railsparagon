require 'rails_helper'

describe Team do

  let(:team) { build(:team) }
  let(:user) { build(:user) }
  let(:users){ create_list(:user, 10) }

  describe '#team_limit' do

    it 'if a team exceeds a limit players' do
      team.users << users
      expect{ team.users << user }.to raise_exception ActiveRecord::Rollback
    end
    
    it 'if limit players not has been exceeded' do
      expect{ team.users << users }.not_to raise_exception
    end
    
  end

end
