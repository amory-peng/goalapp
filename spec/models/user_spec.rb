# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  describe User do
    let! (:valid_user) { User.create(username: "Amory", password: "password") }
    it "validates presence of name" do
      expect(valid_user).to be_valid
    end

    let (:invalid_user) { User.new(username: "Amory") }

    it "validates presence of name" do
      expect(invalid_user).not_to be_valid
    end

    describe "validations" do
      it { should validate_presence_of(:username)}
      it { should validate_uniqueness_of(:username)}
      it { should validate_presence_of(:password_digest)}
    end

    describe "associations" do
      it { should have_many(:goals)}
      it { should have_many(:comments)}
    end

    describe "::find_by_credentials" do
      it "finds user based on correct username and password" do
        joyce = User.create(username: "Joyce", password: "password")
        expect(User.find_by_credentials("Joyce", "password")).to eq(joyce)
      end
    end
  end
end
