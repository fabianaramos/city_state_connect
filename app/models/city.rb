class City < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :state_id }

  belongs_to :state
end
