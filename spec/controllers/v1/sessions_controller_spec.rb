require 'rails_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do
  let(:user) { create(:user, password: 'password', password_confirmation: 'password') }
  let(:user_blank_attributes) { attributes_for(:user, email: '', password: '', password_confirmation: '') }

  context 'token session creation' do
    it 'creates session and returns token' do
      post :create, params: { email: user.email, password: 'password' }
      expect(json['id']).to eq(user.id)
      expect(response).to be_success
    end

    it "doesn't create session" do
      post :create, params: { user: user_blank_attributes }
      expect(response.status).to be(422)
    end
  end
end
