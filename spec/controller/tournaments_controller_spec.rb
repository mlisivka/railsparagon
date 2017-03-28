require 'rails_helper'

describe TournamentsController, type: :controller do

  let(:user){ build(:user) }
  let(:users){ create_list(:user, 5) }
  let(:users_with_current_user){ users.drop(1).push(user) }
  let(:team){ create(:team) }
  let(:tournament){ create(:tournament) }
  let(:tournament_params){ {id: tournament.id, team_id: team.id} }

  describe '#register_team_to_the_tournament' do

    it 'render page' do
      xhr :get, :register_team_to_the_tournament, tournament_params, format: :js
      expect(response).to render_template('register_team_to_the_tournament')
    end

  end

  describe '#add_users_to_the_tournament', :private do

    before do
      controller.instance_variable_set(:@team, team)
      controller.instance_variable_set(:@tournament, tournament)
    end

    it 'if number of players above 5' do
      team.users << user
      subject.log_in(user)
      allow(controller).to receive_messages(params: tournament_params)
      subject.add_users_to_the_tournament
      expect(assigns(:tournament).errors[:team]).not_to be_empty
    end

    it 'if number of players equal 5' do
      team.users << users_with_current_user
      subject.log_in(user)
      allow(controller).to receive_messages(params: tournament_params)
      subject.add_users_to_the_tournament
      expect(assigns(:tournament)).to be_valid
    end

  end

  describe '#detail' do

    it 'render page' do
      xhr :get, :detail, id: tournament.id, team_id: team.id, format: :js
      expect(response).to render_template('detail')
    end

  end

end
