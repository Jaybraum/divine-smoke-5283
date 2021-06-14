require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it {should have_many(:planted)}
    it {should have_many(:plants).through(:planted)}
  end
end
