class Plant < ApplicationRecord
  has_many :planted
  has_many :plots, through: :planted
end
