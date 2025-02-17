require 'rails_helper'

RSpec.describe 'garden show page' do
  before(:each) do
    @garden = Garden.create!(name: 'Jay Gardens', organic: true)

    @plot_1 = @garden.plots.create!(number: 101, size: "Large", direction:'North')
    @plot_2 = @garden.plots.create!(number: 102, size: "Small", direction:'East')
    @plot_3 = @garden.plots.create!(number: 103, size: "Medium", direction:'West')
    @plot_4 = @garden.plots.create!(number: 11, size: "Large", direction:'North')
    @plot_5 = @garden.plots.create!(number: 12, size: "Small", direction:'East')

    @plant_1 = Plant.create!(name: 'Rose', description: "loves the dirt", days_to_harvest: 120)
    @plant_2 = Plant.create!(name: 'Dandelion', description: "loves sunlight", days_to_harvest: 80)
    @plant_3 = Plant.create!(name: 'Pepper', description: "Needs a lot of water", days_to_harvest: 190)
    @plant_4 = Plant.create!(name: 'Cucumber', description: "Needs a lot of water", days_to_harvest: 30)
    @plant_5 = Plant.create!(name: 'Rosemary', description: "loves the dirt", days_to_harvest: 20)
    @plant_6 = Plant.create!(name: 'Pumpkin', description: "Needs Sun", days_to_harvest: 70)


    Planted.create!(plot:@plot_1, plant: @plant_1)
    Planted.create!(plot:@plot_1, plant: @plant_2)
    Planted.create!(plot:@plot_2, plant: @plant_3)
    Planted.create!(plot:@plot_3, plant: @plant_4)
    Planted.create!(plot:@plot_4, plant: @plant_5)
    Planted.create!(plot:@plot_5, plant: @plant_6)
  end

  it 'displays list of all the plants in plots' do
    visit "/gardens/#{@garden.id}"
    
    expect(page.all(".plant")[0].text).to eq(@plant_2.name)
    expect(page.all(".plant")[1].text).to eq(@plant_6.name)
    expect(page.all(".plant")[2].text).to eq(@plant_4.name)
    expect(page.all(".plant")[3].text).to eq(@plant_5.name)
  end
end
