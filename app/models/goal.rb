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
#

class Goal < ActiveRecord::Base
  validates :description, :user, :status, presence: true
  belongs_to :user
  has_many :comments
  after_initialize :set_status

  def set_status
    self.status ||= "private"
  end

end
