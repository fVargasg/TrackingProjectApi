class Task < ApplicationRecord
  belongs_to :story
  validates :name, :story, presence: true
end
