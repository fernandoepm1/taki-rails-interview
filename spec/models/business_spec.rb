require 'rails_helper'

RSpec.describe Business, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:items) }
  end

  describe 'validations' do
    [:name, :address, :city].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
  end
end
