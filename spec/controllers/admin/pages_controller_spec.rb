require 'spec_helper'

describe Admin::PagesController do
  render_views
  login_admin

  describe "index listing pages" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
    it "loads a page" do
      get :index
      expect(response.body).to have_selector("head title", text: "Agitracker: Pages list", visible: false)
    end
    it "contains 4 default links to initial pages" do
      get :index
      expect(response.body).to have_selector(".page-entry", :count => "4")
    end
  end

  describe "show a page" do
    it "returns http success" do
      get :show, { :id => 1 }
      expect(response).to be_success
    end
    it "loads a page" do
      get :show, { :id => 1 }
      expect(response.body).to have_selector("title", :text => "Agitracker: Show home")
    end
  end

  describe "edit a page" do
    it "returns http success" do
      get :edit, { :id => 1 }
      expect(response).to be_success
    end
    it "loads a page" do
      get :edit, { :id => 1 }
      expect(response).to have_selector("title", :content => "Agitracker: Edit home")
    end
    it "contains a form" do
      get :edit, { :id => 1 }
      expect(response).to have_selector("form")
    end

    describe "update a page" do
      before :each do
        @page = create(:page)
      end
      it "saves the changes" do
        post :update, { :id => @page,  :name => "newname"  }
        Page.find(@page.id).name.should == "newname"
        expect(flash[:success]).not_to be_nil
        expect(response).to redirect_to(:action => :show, :id => assigns[:page].id)
      end
      it "don't save if name is not all lowercases" do
        post :update, { :id => @page, :name => "NewName"  }
        Page.find(@page.id).name.should == @page.name
        expect(flash[:success]).not_to be_nil
        expect(response).to be_success
      end

    end
  end

  describe "new page" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
    it "loads a page" do
      get :new
      expect(response).to have_selector("title", :content => "Agitracker: New page")
    end
    it "contains a form" do
      get :new
      expect(response).to have_selector("form")
    end

    describe "creates a new page" do
      before :each do
        @page = build(:page)
      end
      it "saves created page" do
        expect{ post :create, { name: 'test' } }.to change(Page, :count).by(+1)
        expect(flash[:success]).not_to be_nil
        expect(response).to redirect_to(admin_pages_path)
      end
    end

  end

  describe "delete page" do
    it "deletes a page" do
      page = create(:page)
      expect{ delete :destroy, :id => page.id }.to change(Page, :count).by(-1)
      expect(flash[:success]).not_to be_nil
      expect(response).to redirect_to(admin_pages_path)
    end
  end

end
