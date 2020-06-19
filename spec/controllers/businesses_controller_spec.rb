require 'rails_helper'

RSpec.describe BusinessesController, type: :controller do
  before(:each) do
    @current_user = FactoryBot.create(:user)
    login_as(@current_user)
  end

  describe 'GET #new' do
    before { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template('businesses/new')
    end
  end

  describe 'POST #create' do
    before(:each) do
      @business_attributes = FactoryBot.attributes_for(:business, user_id: @current_user.id)
      post :create, params: { business: @business_attributes }
    end

    it 'redirects to user profile' do
      expect(response).to redirect_to(user_path(@current_user))
    end

    it 'creates a business with valid attributes' do
      business = @current_user.business

      expect(business.user).to eql(@current_user)
      expect(business.name).to eql(@business_attributes[:name])
      expect(business.address).to eql(@business_attributes[:address])
      expect(business.city).to eql(@business_attributes[:city])
    end
  end

  describe 'GET #edit' do
    before(:each) do
      @business = FactoryBot.create(:business, user: @current_user)
      get :edit, params: { id: @business.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template('businesses/edit')
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @business = FactoryBot.create(:business, user: @current_user)
      @business_new_attributes = {
        name: 'A new name',
        address: 'A new address',
        city: 'A new city'
      }

      put :update, params: { id: @business.id, business: @business_new_attributes }
      @business.reload
    end

    it 'redirects to user profile' do
      expect(response).to redirect_to(user_path(@business.user))
    end

    it 'updates the current business with the given attributes' do
      expect(@business.name).to eql(@business_new_attributes[:name])
      expect(@business.address).to eql(@business_new_attributes[:address])
      expect(@business.city).to eql(@business_new_attributes[:city])
    end
  end
end
