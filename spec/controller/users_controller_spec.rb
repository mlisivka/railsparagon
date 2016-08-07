require 'rails_helper'

describe UsersController, type: :controller do
  
  when_not_found :show
  
  describe '.show' do
  
    it 'when user found' do
      user = create(:user)
      get :show, name: user.name
      expect(response).to render_template :show
    end
  
  end
  
end