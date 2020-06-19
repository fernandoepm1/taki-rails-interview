require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do
    it 'routes to #new via GET' do
      expect(get: '/signup').to route_to('users#new')
    end

    it 'routes to #create via POST' do
      expect(post: '/signup').to route_to('users#create')
    end

    it 'routes to #edit via GET' do
      expect(get: '/users/1/edit').to route_to('users#edit', id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/users/1').to route_to('users#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/users/1').to route_to('users#update', id: '1')
    end
  end
end
