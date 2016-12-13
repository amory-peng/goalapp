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

class GoalComment < ActiveRecord::Base
  validates :description, presence: true

  belongs_to :author,
  class_name: :User

  belongs_to :goal

end
