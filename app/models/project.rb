# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :user
  validates :name, :description, :status, :user, presence: true
end
