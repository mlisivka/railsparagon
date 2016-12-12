require 'rails_helper'

describe TournamentsController, type: :controller do
  
  let(:user){ build(:user) }
  let(:users){ create_list(:user, 5) }
  let(:users_with_current_user){ users.drop(1).push(user) }
  let!(:team){ create(:team) }
  let(:tournament){ create(:tournament) }
  let(:tournament_params){ {id: tournament.id, team_id: team.id, players: users.map(&:id)} }
    
  describe '#register_team_to_the_tournament' do
    
    it 'render page' do
      xhr :get, :register_team_to_the_tournament, tournament_params, format: :js
      expect(response).to render_template('register_team_to_the_tournament')
    end
    
  end
  
  describe '#add_players_to_the_tournament', :private do
      
    before { controller.instance_variable_set(:@team, team) }
      
    it 'if number of players above 5' do
      team.users << user
      sign_in(user, scope: :user)
      allow(controller).to receive_messages(params: { id: tournament.id, team_id: team.id, players: [user.id] })
      subject.add_players_to_the_tournament
      expect(assigns(:registration_players)).to be_invalid
    end
    
    it 'if number of players equal 5' do
      team.users << users_with_current_user
      sign_in(user, scope: :user)
      allow(controller).to receive_messages(params: tournament_params)
      subject.add_players_to_the_tournament
      expect(assigns(:registration_players)).to be_valid
    end
    
  end
  
  describe '#registration_players_to_the_tournament', :private do
    
    before do 
      controller.instance_variable_set(:@team, team)
      allow(controller).to receive_messages(params: tournament_params)
    end
    
    it 'if user authenticated and is a member this team' do
      team.users << users_with_current_user
      sign_in(user, scope: :user)
      subject.registration_players_to_the_tournament
      expect(assigns(:registration_players)).to be_valid
    end
    
    it 'if user not authenticated' do
      team.users << users
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