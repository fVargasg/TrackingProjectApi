class Story < ApplicationRecord
  belongs_to :project
  has_many :tasks
  validates :name, :description, :typestory, :difficulty, :project, presence: true
end
