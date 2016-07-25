require 'rails_helper'

describe Invite do
  
  let(:team) { create(:team) }
  let(:user) { create(:user) }
  let(:user1){ create(:user) }
  
  describe ".validates" do
   
    it '#send_self' do
      invite = build(:invite, sender: user, recipient: user)
      expect(invite).to be_invalid
    end
    
    it 'already_member' do
      team.users << user
      invite = build(:invite, team: team, recipient: user)
      expect(invite).to be_invalid
    end
    
    it '#already_received' do
      invite1 = Invite.create(team_id: team.id, sender_id: user.id, recipient_id: user1.id)
      invite = Invite.new(team_id: team.id, sender_id: user.id, recipient_id: user1.id)
      expect(invite).to be_invalid
    end
    
  end
  
end