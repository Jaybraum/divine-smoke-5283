require 'rails_helper'

RSpec.describe Plant, type: :model do
  it {should have_many(:planted)}
  it {should have_many(:plots).through(:planted)}
end
