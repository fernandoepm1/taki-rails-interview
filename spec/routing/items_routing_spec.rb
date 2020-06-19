require 'rails_helper'

RSpec.describe ItemsController, type: :routing do
  describe 'routing' do
    it 'routes to #index via GET' do
      expect(get: '/items').to route_to('items#index')
    end

    it 'routes to #new via GET' do
      expect(get: '/items/new').to route_to('items#new')
    end

    it 'routes to #create via POST' do
      expect(post: '/items').to route_to('items#create')
    end

    it 'routes to #edit via GET' do
      expect(get: '/items/1/edit').to route_to('items#edit', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/items/1').to route_to('items#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/items/1').to route_to('items#update', id: '1')
    end

    it 'routes to #destroy via DELETE' do
      expect(delete: '/items/1').to route_to('items#destroy', id: '1')
    end
  end
end
