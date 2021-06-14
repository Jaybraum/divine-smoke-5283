require 'rails_helper'

RSpec.describe 'plots index page' do
  before(:each) do
    @garden_1 = Garden.create!(name: 'Jay Gardens', organic: true)
    @garden_2 = Garden.create!(name: 'Ana Gardens', organic: false)


    @plot_1 = @garden_1.plots.create!(number: 101, size: "Large", direction:'North')
    @plot_2 = @garden_1.plots.create!(number: 102, size: "Small", direction:'East')
    @plot_3 = @garden_1.plots.create!(number: 103, size: "Medium", direction:'West')
    @plot_4 = @garden_2.plots.create!(number: 11, size: "Large", direction:'North')
    @plot_5 = @garden_2.plots.create!(number: 12, size: "Small", direction:'East')

    @plant_1 = Plant.create!(name: 'Rose', description: "loves the dirt", days_to_harvest: 10)
    @plant_2 = Plant.create!(name: 'Dandelion', description: "loves sunlight", days_to_harvest: 60)
    @plant_3 = Plant.create!(name: 'Pepper', description: "Needs a lot of water", days_to_harvest: 90)
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

  it 'displays all the plot numbers' do
    visit '/plots'

    within "#plot-#{@plot_1.id}" do
      expect(page).to have_content(@plot_1.number)
      expect(page).to have_content(@plant_1.name)
      expect(page).to have_content(@plant_2.name)
    end
  end

  it 'has button to remove plant from plot' do
    visit '/plots'

    within "#plant-#{@plant_1.id}" do
      click_button 'Remove plant'
    end

    expect(page).to have_content(@plot_1.number)
    expect(page).to have_content(@plant_1.name)
    expect(page).to_not have_content(@plant_1.name)
  end
end
