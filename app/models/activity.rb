class Activity < ApplicationRecord
  has_one :event_type
  has_one_attached :image
  belongs_to :user

  def event_type
    EventType.find(self.event_type_id)
  end
end
