class Activity < ApplicationRecord
  has_one :event_type
  has_one_attached :image
  belongs_to :user
end
