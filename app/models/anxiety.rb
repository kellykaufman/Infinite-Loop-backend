class Anxiety < ApplicationRecord
  belongs_to :user
  validates :intrusive_thought_or_feeling, presence: true
end
