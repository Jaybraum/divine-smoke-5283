require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
  end

  before(:each) do
    @garden = Garden.create!(name: 'Jay Gardens', organic: true)

    @plot_1 = @garden.plots.create!(number: 101, size: "Large", direction:'North')
    @plot_2 = @garden.plots.create!(number: 102, size: "Small", direction:'East')
    @plot_3 = @garden.plots.create!(number: 103, size: "Medium", direction:'West')
    @plot_4 = @garden.plots.create!(number: 11, size: "Large", direction:'North')
    @plot_5 = @garden.plots.create!(number: 12, size: "Small", direction:'East')

    @plant_1 = Plant.create!(name: 'Rose', description: "loves the dirt", days_to_harvest: 120)
    @plant_2 = Plant.create!(name: 'Dandelion', description: "loves sunlight", days_to_harvest: 60)
    @plant_3 = Plant.create!(name: 'Pepper', description: "Needs a lot of water", days_to_harvest: 190)
    @plant_4 = Plant.create!(name: 'Cucumber', description: "Needs a lot of water", days_to_harvest: 30)
    @plant_5 = Plant.create!(name: 'Rosemary', description: "loves the dirt", days_to_harvest: 30)
    @plant_6 = Plant.create!(name: 'Pumpkin', description: "Needs Sun", days_to_harvest: 60)


    Planted.create!(plot:@plot_1, plant: @plant_1)
    Planted.create!(plot:@plot_1, plant: @plant_2)
    Planted.create!(plot:@plot_2, plant: @plant_3)
    Planted.create!(plot:@plot_3, plant: @plant_4)
    Planted.create!(plot:@plot_4, plant: @plant_5)
    Planted.create!(plot:@plot_5, plant: @plant_6)
  end

  describe 'instance methods' do
    it '#short_harvest' do

      expect(@garden.short_harvest[0].name).to eq("Dandelion")
    end
  end
end
