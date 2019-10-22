class Link < ApplicationRecord
  belongs_to :user, optional: true
  has_many :votes
  validates :url, presence: true, uniqueness: true

  after_save :notify_subscriber_of_addition


  def notify_subscriber_of_addition
    RailsGraphqlDemoSchema.subscriptions.trigger("newLink", {}, self)
  end
end
