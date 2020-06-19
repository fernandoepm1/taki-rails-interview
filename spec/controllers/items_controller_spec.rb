require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  before(:each) do
    @current_user = FactoryBot.create(:user)
    login_as(@current_user)

    @current_business = FactoryBot.create(:business, user: @current_user)
  end

  describe 'GET #index' do
    before { get :index }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template('items/index')
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      expect(response).to render_template('items/new')
    end
  end

  describe 'POST #create' do
    before(:each) do
      @item_attributes = FactoryBot.attributes_for(:item, business_id: @current_business.id)
      post :create, params: { item: @item_attributes }
    end

    it 'redirects to current business item list' do
      expect(response).to redirect_to(items_path)
    end

    it 'creates an item with the given attributes' do
      item = Item.last

      expect(item.business).to eql(@current_business)
      expect(item.description).to eql(@item_attributes[:description])
      expect(item.price).to eql(@item_attributes[:price])
    end
  end

  describe 'GET #edit' do
    before(:each) do
      @item = FactoryBot.create(:item, business: @current_business)
      get :edit, params: { id: @item.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'renders the edit template' do
      expect(response).to render_template('items/edit')
    end
  end

  describe 'PUT #update' do
    before(:each) do
      @item = FactoryBot.create(:item, business: @current_business)
      @item_new_attributes = { description: 'Cool description', price: 666.0 }

      put :update, params: { id: @item.id, item: @item_new_attributes }
      @item.reload
    end

    it 'redirects to business item list' do
      expect(response).to redirect_to(items_path)
    end

    it 'updates the item with the given attributes' do
      expect(@item.description).to eql(@item_new_attributes[:description])
      expect(@item.price).to eql(@item_new_attributes[:price])
    end
  end

  describe 'DELETE #destroy' do
    before do
      @item1 = FactoryBot.create(:item, business: @current_business)
      @item2 = FactoryBot.create(:item, business: @current_business)
      @item3 = FactoryBot.create(:item, business: @current_business)
    end

    let(:delete_item) do
      delete :destroy, params: { id: @item2.id }
    end

    it 'changes the Item count' do
      expect { delete_item }.to change { Item.count }.by(-1)
    end
  end
end
