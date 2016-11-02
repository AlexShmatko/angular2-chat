require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user)  { create(:user) }
  let(:user_attributes) { attributes_for(:user) }
  let(:user_blank_attributes) { attributes_for(:user, email: '', password: '', password_confirmation: '') }
  let(:user_wrong_password_confirmation) { attributes_for(:user, email: 'kostya.doletskiy@yahoo.com', password: 'password', password_confirmation: 'somethingelse') }

  context 'user authentication' do
    it 'creates user' do
      post :create, params: { user: user_attributes }
      expect(json['token']).to_not be_nil()
    end

    it "doesn't create user with blank attributes" do
      post :create, params: { user: user_blank_attributes }
      expect(json['token']).to be_nil()
    end

    it "doesn't create user when password confirmation is wrong" do
      post :create, params: { user: user_wrong_password_confirmation }
      expect(json['token']).to be_nil()
    end
  end
end
