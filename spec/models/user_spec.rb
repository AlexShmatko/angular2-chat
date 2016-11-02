require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:email) }
    it { should allow_value('vlad.shevtsov@gmail.com', 'stadnik@active-bridge.com', 'sobchuk@yandex.ru').for(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_length_of(:password).is_at_least(6) }
  end
end
