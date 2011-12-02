require 'spec_helper'

describe PagesController do

  before :all do
    @browser = Watir::Browser.new 
  end

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
     it "displays a page with text" do
       @browser.goto 'localhost:3000/'
	     @browser.text.include?('Home').should == true
     end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end

end
