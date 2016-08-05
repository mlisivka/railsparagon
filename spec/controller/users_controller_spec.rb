require 'rails_helper'

describe UsersController, type: :controller do
  
  when_not_found :show
  
  describe '.show' do
  
    it 'when user found' do
      create(:user)
      get :show, id: 1
      expect(response).to render_template :show
    end
  
  end
  
end