require 'spec_helper'

describe Admin::PagesController do
  render_views

  describe "index listing pages" do
    it "returns http success" do
      get :index
      response.should be_success
    end
    it "loads a page" do
      get :index
      response.should have_selector("title", :content => "Agitracker: Pages list")
    end
    it "contains 4 default links to initial pages" do
      get :index
      response.should have_selector(".page-entry", :count => "4")
    end
  end

  describe "show a page" do
    it "returns http success" do
      get :show, { :id => 1 }
      response.should be_success
    end
    it "loads a page" do
      get :show, { :id => 1 }
      response.should have_selector("title", :content => "Agitracker: Show home")
    end
  end

  describe "edit a page" do
    it "returns http success" do
      get :edit, { :id => 1 }
      response.should be_success
    end
    it "loads a page" do
      get :edit, { :id => 1 }
      response.should have_selector("title", :content => "Agitracker: Edit home")
    end
    it "contains a form" do
      get :edit, { :id => 1 }
      response.should have_selector("form")
    end
  end

  pending "update: we modify the page"
  pending "update: we check validations"
  pending "new: we see the form"
  pending "create: we create a new page"
  pending "delete: we remove a page"

end
