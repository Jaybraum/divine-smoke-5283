class Garden < ApplicationRecord
  has_many :plots

  def short_harvest
   Plant.joins(:plots)
   .where("days_to_harvest < ?", 100)
   .order("days_to_harvest desc")
   .distinct
 end
end
