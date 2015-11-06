require 'spec_helper'

describe Page do
  before do
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
      expect(Page.new(@attr.merge(:name => ""))).not_to be_valid
    end

    it "requires the name is only alphanumeric lowercase" do
      expect(Page.new(@attr.merge(:name => "test Name"))).not_to be_valid
    end

    it "requires the name is less than 16 chars" do
      expect(Page.new(@attr.merge(:name => "a" * 17))).not_to be_valid
    end

  end

end
