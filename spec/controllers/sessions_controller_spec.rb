require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  let!(:user) { User.create(username: "Joyce", password: "password") }

  describe "POST #create" do
    context "with invalid credentials" do
      it "returns to sign in page" do
        post :create, user: { }
      end
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      post :create, user: { username: "Joyce", password: "password"}
      token = User.find_by(username: "Joyce").session_token
    end

    it "log outs and redirects to a new session" do
      delete :destroy
      expect(session[:session_token]).to be_nil

      joyce = User.find_by(username: "Joyce")
      expect(joyce.session_token).not_to eq(token)
    end

  end
end
