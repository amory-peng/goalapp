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

FactoryGirl.define do
  factory :goal_comment do
    author_id 1
    goal_id 1
    description "MyString"
  end
end
