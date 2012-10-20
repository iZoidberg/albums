class Album < ActiveRecord::Base
  attr_accessible :artist, :title, :user_id

  belongs_to :user

  scope :by_user, lambda{ |user_id| where(user_id: user_id) }
end
