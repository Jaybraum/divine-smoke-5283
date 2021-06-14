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

    @plant_1 = Plant.create!(name: 'Rose', description: "loves the dirt", days_to_harvest: 120)
    @plant_2 = Plant.create!(name: 'Dandelion', description: "loves sunlight", days_to_harvest: 80)
    @plant_3 = Plant.create!(name: 'Pepper', description: "Needs a lot of water", days_to_harvest: 190)
    @plant_4 = Plant.create!(name: 'Cucumber', description: "Needs a lot of water", days_to_harvest: 30)
    @plant_5 = Plant.create!(name: 'Rosemary', description: "loves the dirt", days_to_harvest: 20)
    @plant_6 = Plant.create!(name: 'Pumpkin', description: "Needs Sun", days_to_harvest: 70)


    Planted.create!(plot:@plot_1, plant: @plant_1)
    Planted.create!(plot:@plot_1, plant: @plant_2)
    Planted.create!(plot:@plot_2, plant: @plant_3)
    Planted.create!(plot:@plot_2, plant: @plant_4)
    Planted.create!(plot:@plot_2, plant: @plant_5)
    Planted.create!(plot:@plot_3, plant: @plant_6)
  end

  describe 'instance methods' do
    it '#short_harvest' do

      expect(@garden.short_harvest).to include(@plant_2)
      expect(@garden.short_harvest).to include(@plant_4)
      expect(@garden.short_harvest).to include(@plant_5)
      expect(@garden.short_harvest).to include(@plant_6)
    end

    it 'does not include plants with harvest dates larger than 100' do

      expect(@garden.short_harvest).to_not include(@plant_3)
    end

    xit 'sorts plants by number of plants a plot has in descending order' do

      expect(@garden.short_harvest[0].name).to eq(@plant_4)#because 3 plants in plot 2
      expect(@garden.short_harvest[1].name).to eq(@plant_5)#because 3 plants in plot 2
      expect(@garden.short_harvest[2].name).to eq(@plant_2)#because 2 plants in plot 1
    end
  end
end
