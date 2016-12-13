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

FactoryGirl.define do
  factory :goal do
    
  end
end
