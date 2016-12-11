require 'rails_helper'

describe TournamentsController, type: :controller do
  
  let(:user){ build(:user) }
  let(:users){ create_list(:user, 5) }
  let!(:team){ create(:team) }
  let(:tournament){ create(:tournament) }
    
  describe '#register_team_to_the_tournament' do
    
    it 'render page' do
      xhr :get, :register_team_to_the_tournament, id: tournament.id, team_id: team.id, players: users.map(&:id), format: :js
      expect(response).to render_template('register_team_to_the_tournament')
    end
    
  end
  
  describe '#add_players_to_the_tournament' do
      
    before { controller.instance_variable_set(:@team, team) }
      
    it 'if number of players above 5' do
      allow(controller).to receive_messages(params: { players: [user.id]})
      subject.add_players_to_the_tournament
      expect(assigns(:registration_players)).to be_invalid
    end
    
    it 'if number of players equal 5' do
      team.users << user
      sign_in(user, scope: :user)
      allow(controller).to receive_messages(params: { id: tournament.id, team_id: team.id , players: users.map(&:id)})
      subject.add_players_to_the_tournament
      expect(assigns(:registration_players)).to be_valid
    end
    
  end
  
  describe '#registration_players_to_the_tournament' do
    
    before do 
      controller.instance_variable_set(:@team, team)
      allow(controller).to receive_messages(params: { id: tournament.id, team_id: team.id , players: users.map(&:id)})
    end
    
    it 'if user authenticated and is a member this team' do
      team.users << user
      sign_in(user, scope: :user)
      
      subject.registration_players_to_the_tournament
      expect(assigns(:registration_players)).to be_valid
    end
    
    it 'if user not authenticated' do
      team.users << user
      subject.registration_players_to_the_tournament
      expect(assigns(:registration_players)).to be_nil
    end
    
    it 'if user not a member this team' do
      sign_in(user, scope: :user)
      subject.registration_players_to_the_tournament
      expect(assigns(:registration_players)).to be_nil
    end
    
  end
  
  describe '#detail' do
    
    it 'render page' do
      xhr :get, :detail, id: tournament.id, team_id: team.id, format: :js
      expect(response).to render_template('detail')
    end
    
  end
      
end