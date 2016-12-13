# == Schema Information
#
# Table name: user_comments
#
#  id          :integer          not null, primary key
#  author_id   :integer
#  user_id     :integer
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :user_comment do
    user_id 1
    description "MyString"
  end
end
