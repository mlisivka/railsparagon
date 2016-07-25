require 'rails_helper'

describe SessionController, type: :controller do
  
  describe '.create' do
    
    it 'when user found' do
      create(:user, name: "admin")
      session[:return_to] = root_path
      post :create, name: "admin" 
      expect(session[:user_id]).to eq(1)
      expect(response).to redirect_to root_path
    end
    
    it 'when user not found' do
      post :create, name: "userName" 
      expect(response).to render_template :new
    end
    
  end
  
  it '.destroy' do
    session[:return_to] = root_path
    delete :destroy
    expect(session[:user_id]).to eq(nil)
    expect(response).to redirect_to root_path
  end
  
end