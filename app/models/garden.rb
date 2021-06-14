class Garden < ApplicationRecord
  has_many :plots

  def short_harvest
   Plant.joins(:plots)
   .where("days_to_harvest < ?", 100)
   .order("days_to_harvest desc")
   .distinct
 end
end

#extension method
# def short_harvest
#  Plant.select('plants.*, count(distinct plots.id) as plot_count')
#  .joins(:plots)
#  .where('days_to_harvest < ?', 100)
#  .group(:id)
#  .order("plot_count desc")
#  .distinct
