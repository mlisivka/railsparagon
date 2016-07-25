require 'rails_helper'

describe Invite do
  let(:team){Team.create(full_name: "Name", captain_id: 1)}
  let(:user){User.create(name: "Jopa")}
  
  context ".validates" do
   
    it '#send_self' do
      invite = Invite.new(team_id: team.id, sender_id: 2, recipient_id: 2)
      expect(invite).to be_invalid
    end
    
    it 'already_member' do
      team.users << user
      invite = Invite.new(team_id: team.id, sender_id: 2, recipient_id: user.id)
      expect(invite).to be_invalid
    end
    
    it '#already_received' do
      invite1 = Invite.create(team_id: team.id, sender_id: 2, recipient_id: 1)
      invite2 = Invite.new(team_id: team.id, sender_id: 2, recipient_id: 1)
      expect(invite2).to be_invalid
    end
    
  end
  
end