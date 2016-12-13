# == Schema Information
#
# Table name: goals
#
#  id          :integer          not null, primary key
#  description :string
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status      :string
#  completed   :boolean          default("f")
#

require 'rails_helper'

RSpec.describe Goal, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe Goal do
    let! (:valid_goal) { Goal.create(description: "Pass Assessment 4", user_id: 1) }

    describe "validations" do
      it { should validate_presence_of(:user)}
      it { should validate_presence_of(:description)}
    end

    describe "association" do
      it { should belong_to(:user)}
      it { should have_many(:comments)}
    end
  end
end
