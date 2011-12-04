require 'spec_helper'

describe Page do
  before :each do
    @attr = {
      :name => "name",
      :title => "My title",
      :content => "sample content"
    }
  end

  it "should create a new page if valid attributes are provided" do
    Page.create!(@attr)
  end

  describe "validations" do
    
    it "requires a non-empty name" do
      Page.new(@attr.merge(:name => "")).should_not be_valid
    end

    it "requires the name is only alphanumeric lowercase" do
      Page.new(@attr.merge(:name => "test Name")).should_not be_valid
    end

    it "requires the name is less than 16 chars" do
      Page.new(@attr.merge(:name => "a" * 17)).should_not be_valid
    end

  end

end
