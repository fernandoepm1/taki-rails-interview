require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template('sessions/new')
    end
  end

  describe 'POST #create' do
    before do
      @user = FactoryBot.create(:user)
      session_params = { email: @user.email, password: @user.password }

      post :create, params: { session: session_params }
    end

    it 'redirects to user profile' do
      expect(response).to redirect_to(user_path(@user))
    end
  end

  describe 'DELETE #destroy' do
    before do
      @user = FactoryBot.create(:user)
      login_as(@user)
    end

    it 'redirects to login page' do
      delete :destroy
      expect(response).to redirect_to(root_url)
    end
  end
end
