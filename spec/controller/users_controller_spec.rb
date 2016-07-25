require 'rails_helper'

describe UsersController, type: :controller do
  
  when_not_found :show
  
  describe '.create' do
    
    it 'when validation pass' do
      session[:return_to] = root_path
      post :create, user: { name: "admin" }
      expect(response).to redirect_to root_path
    end
    
    it 'when validation not pass' do
      post :create, user: { name: "ad" }
      expect(response).to render_template :new
    end
    
  end
  
  describe '.show' do
  
    it 'when user found' do
      create(:user)
      get :show, id: 1
      expect(response).to render_template :show
    end
  
  end
  
end