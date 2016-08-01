require 'rails_helper'

describe User do

  let(:user) { build(:user) }
  let(:teams){ create_list(:team, 6) }

  context 'when logged in' do
    #it { is_expected.to respond_with 200 }
  end
  context 'when logged out' do
    #it { is_expected.to respond_with 401 }
  end

  describe '.before_add' do

    it '#player_limit' do
      expect{ user.teams << teams }.to raise_exception ActiveRecord::Rollback
    end

  end

end
