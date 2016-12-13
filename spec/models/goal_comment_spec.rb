# == Schema Information
#
# Table name: goal_comments
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  goal_id     :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe GoalComment, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "validations" do
    it { should validate_presence_of(:description)}
  end

  describe "associations" do
    it { should belong_to(:author)}
    it { should belong_to(:goal)}
  end

end
