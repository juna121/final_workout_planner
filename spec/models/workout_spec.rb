require 'rails_helper'

RSpec.describe Workout, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:circuits) }

    it { should belong_to(:user) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do
      
    end
end
