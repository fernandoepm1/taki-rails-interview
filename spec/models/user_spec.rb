require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_one(:business) }
  end

  describe 'validations' do
    [:first_name, :last_name, :email].each do |attribute|
      it { should validate_presence_of(attribute) }
    end
  end

  describe 'secure password' do
    it { should have_secure_password }
  end
end
