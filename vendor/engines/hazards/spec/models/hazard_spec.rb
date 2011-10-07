require 'spec_helper'

describe Hazard do

  def reset_hazard(options = {})
    @valid_attributes = {
      :id => 1,
      :title => "RSpec is great for testing too"
    }

    @hazard.destroy! if @hazard
    @hazard = Hazard.create!(@valid_attributes.update(options))
  end

  before(:each) do
    reset_hazard
  end

  context "validations" do
    
    it "rejects empty title" do
      Hazard.new(@valid_attributes.merge(:title => "")).should_not be_valid
    end

    it "rejects non unique title" do
      # as one gets created before each spec by reset_hazard
      Hazard.new(@valid_attributes).should_not be_valid
    end
    
  end

end