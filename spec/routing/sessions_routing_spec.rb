require 'rails_helper'

RSpec.describe SessionsController, type: :routing do
  describe 'routing' do
    it 'routes to #new via GET' do
      expect(get: '/login').to route_to('sessions#new')
    end

    it 'routes to #create via POST' do
      expect(post: '/login').to route_to('sessions#create')
    end

    it 'routes to #destroy via DELETE' do
      expect(delete: '/logout').to route_to('sessions#destroy')
    end
  end
end
