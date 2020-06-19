require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    context 'if user is present' do
      before(:each) do
        @current_user = FactoryBot.create(:user)
        login_as(@current_user)

        get :index
      end

      it 'returns http found' do
        expect(response).to have_http_status(302)
      end

      it 'renders user page' do
        expect(response).to redirect_to(user_path(@current_user))
      end
    end

    context 'if user is not present' do
      before { get :index }

      it 'returns http found' do
        expect(response).to have_http_status(302)
      end

      it 'redirects to login page' do
        expect(response).to redirect_to('/login')
      end
    end
  end
end
