class Reserve < ApplicationRecord
  belongs_to :user

  validates :datetime, presence: true, uniqueness: true
  validates :description, presence: true
end
