require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'associations' do
    it { should belong_to(:business) }
  end

  describe 'validations' do
    [:description, :price].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
  end
end
