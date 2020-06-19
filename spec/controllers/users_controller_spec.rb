require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    before { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template('users/new')
    end
  end

  describe 'POST #create' do
    before(:each) do
      @user_attributes = FactoryBot.attributes_for(:user)
      post :create, params: { user: @user_attributes }
    end

    it 'redirects to user profile' do
      expect(response).to redirect_to('/login')
    end

    it 'creates a user with the given attributes' do
      user = User.last

      expect(user.first_name).to eql(@user_attributes[:first_name])
      expect(user.last_name).to eql(@user_attributes[:last_name])
      expect(user.email).to eql(@user_attributes[:email])
    end
  end

  describe 'GET #edit' do
    before(:each) do
      @user = FactoryBot.create(:user)
      login_as(@user)

      get :edit, params: { id: @user.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template('users/edit')
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @user = FactoryBot.create(:user)
      login_as(@user)

      @user_new_attributes = {
        first_name: 'Cool first name',
        last_name: 'Cool last name',
        email: 'Cool email'
      }

      put :update, params: { id: @user.id, user: @user_new_attributes }
      @user.reload
    end

    it 'redirects to user profile' do
      expect(response).to redirect_to(user_path(@user))
    end

    it 'updates the user with the given attributes' do
      expect(@user.first_name).to eql(@user_new_attributes[:first_name])
      expect(@user.last_name).to eql(@user_new_attributes[:last_name])
      expect(@user.email).to eql(@user_new_attributes[:email])
    end
  end
end
