require 'rails_helper'

describe ApplicationController, type: :controller do
    
  let(:user){create(:user)}
  
  before do
    subject.sign_in(user)
  end
  
  describe '#current_user' do
    it 'return user' do
      expect(subject.current_user).to eq(user)
    end
  end
  
  describe '#team_invite' do
    it 'return invitions of team' do
      expect(subject.team_invite).to eq(user.invitions.where("accepted IS NULL"))
    end
  end
  
end