require 'rails_helper'

describe UsersController, type: :controller do
  
  let(:user){ create(:user) }
  
  describe '#show' do
  
    it 'when user signed in and go to other profile' do
      sign_in(user, scope: :user)
      get :show, name: user.name
      expect(response).to render_template :show
    end
    
    it 'when user signed in and go to your profile' do
      sign_in(user, scope: :user)
      get :show
      expect(response).to render_template :show
    end
    
    it 'when user not signed in and go to other profile' do
      get :show, name: user.name
      expect(response).to render_template :show
    end
    
    it 'when user not signed in and go to your profile' do
      get :show
      expect(response).to redirect_to login_path
    end
    
    it 'when user not found' do
      get :show, name: 'not_found_name'
      expect(response.status).to eq(404)
    end
    
  end
  
  describe '#show_my_profile', :private do
    
    it 'return current_user' do 
      sign_in(user, scope: :user)
      subject.show_my_profile
      expect(assigns(:user)).to eq(user)
    end
    
  end
  
  describe '#show_other_profile', :private do
    
    it 'return user' do 
      allow(controller).to receive_messages(params: { name: user.name})
      subject.show_other_profile
      expect(assigns(:user)).to eq(user)
    end
    
    it 'return teams' do 
      current_user = create(:user)
      sign_in(current_user, scope: :user)
      allow(controller).to receive_messages(params: { name: user.name})
      subject.show_other_profile
      expect(assigns(:teams)).to eq(current_user.teams)
    end
    
  end
  
end