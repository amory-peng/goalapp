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

class Goal < ActiveRecord::Base
  validates :description, :user, :status, presence: true
  belongs_to :user
  has_many :comments
  has_many :goal_comments
  after_initialize :set_status

  def set_status
    self.status ||= "private"
  end

end
