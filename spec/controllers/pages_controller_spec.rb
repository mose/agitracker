require 'spec_helper'

describe PagesController do

  describe "GET 'home'" do
    Page.create(name: 'home')
    it "returns http success" do
      get :show,  { name: 'home' }
      response.should be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "home" }
      expect(response).to have_selector("title", :content => "Agitracker: Home")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get :show, { :name => "contact" }
      expect(response).to be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "contact" }
      expect(response).to have_selector("title", :content => "Agitracker: Contact")
    end
  end

  describe "GET 'help'" do
    it "returns http success" do
      get :show, { :name => "help" }
      expect(response).to be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "help" }
      expect(response).to have_selector("title", :content => "Agitracker: Help")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get :show, { :name => "about" }
      expect(response).to be_success
    end
    it "displays a page with proper title" do
      get :show, { :name => "about" }
      expect(response).to have_selector("title", :content => "Agitracker: About")
    end
  end

end
