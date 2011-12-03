require 'spec_helper'

describe PagesController do
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get :show,  { :name => :home }
      response.should be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "home" }
      response.should have_selector("title", :content => "Agitracker: Home")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get :show, { :name => "contact" }
      response.should be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "contact" }
      response.should have_selector("title", :content => "Agitracker: Contact")
    end
  end

  describe "GET 'help'" do
    it "returns http success" do
      get :show, { :name => "help" }
      response.should be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "help" }
      response.should have_selector("title", :content => "Agitracker: Help")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get :show, { :name => "about" }
      response.should be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "about" }
      response.should have_selector("title", :content => "Agitracker: About")
    end
  end

end
