require 'rails_helper'

describe ApplicationController, type: :controller do
    
  let(:user){create(:user)}
  
  before do
    subject.log_in(user)
  end
  
  describe '#log_in' do 
    it "when the user exists" do
      expect(session[:user_id]).to eq(user.id)
    end
  end
  
  describe '#current_user' do
    it 'return user' do
      expect(subject.current_user).to eq(user)
    end
  end
  
  describe '#log_out' do
    it 'delete session[:user_id]' do
      subject.log_out
      expect(session[:user_id]).to eq(nil)
    end
  end
  
  describe '#team_invite' do
    it 'return invitions of team' do
      expect(subject.team_invite).to eq(user.invitions.where("accepted IS NULL"))
    end
  end
  
end