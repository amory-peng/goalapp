require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "Get #new" do
    it "renders new template" do
      post :new
      expect(response).to render_template(:new)
    end
  end

  describe "Post #create" do
    context "with valid params" do
      it "validates the presence of username and password" do
        post :create, user: { username: "Amory", password: "password"}
        expect(response).to have_http_status(200)
      end
    end

    context "with invalid params" do
      it "validates the presence of username and password" do
        post :create, user: { username: "Amory"}
        expect(response).to render_template("new")
      end
    end
  end



end
