require 'rails_helper'

RSpec.describe BusinessesController, type: :routing do
  describe 'routing' do
    it 'routes to #new via GET' do
      expect(get: '/businesses/new').to route_to('businesses#new')
    end

    it 'routes to #create via POST' do
      expect(post: '/businesses').to route_to('businesses#create')
    end

    it 'routes to #edit via GET' do
      expect(get: '/businesses/1/edit').to route_to('businesses#edit', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/businesses/1').to route_to('businesses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/businesses/1').to route_to('businesses#update', id: '1')
    end
  end
end
