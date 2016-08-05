
require 'rails_helper'

describe User do

  let(:team) { build(:team) }
  let(:users){ create_list(:user, 11) }

  describe '.before_add' do

    it '#team_limit' do
      team.users << users
      puts team.errors.inspect
      expect{ team.users << users }.to raise_exception ActiveRecord::Rollback
    end

  end

end
