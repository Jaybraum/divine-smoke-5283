class Plot < ApplicationRecord
  belongs_to :garden
  has_many :planted
  has_many :plants, through: :planted
end
