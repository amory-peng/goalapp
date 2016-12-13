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

class UserComment < ActiveRecord::Base
  validates :description, presence: true

  has_many :user_comments
  belongs_to :author,
  class_name: :User

  belongs_to :user
end
