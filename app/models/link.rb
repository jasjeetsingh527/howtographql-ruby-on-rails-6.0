class Link < ApplicationRecord
  belongs_to :user, optional: true
  has_many :votes
  validates :url, presence: true, uniqueness: true
end
