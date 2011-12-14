require 'spec_helper'

describe Admin::UsersController do
  render_views
  login_admin
  
  describe "lists users" do
    it "returns http success" do
      get :index
      response.should be_success
    end
    it "loads a page" do
      get :index
      response.should have_selector("title", :content => "Agitracker: Users list")
    end
    it "contains the default user" do
      get :index
      response.should have_selector(".user-entry")
    end
  end

  describe "shows a user" do
    it "returns http success" do
      get :show, { :id => 1 }
      response.should be_success
    end
    it "loads a page" do
      get :show, { :id => 1 }
      response.should have_selector("title", :content => "Agitracker: Show admin")
    end

  end

  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, { :id => 1 }
      response.should be_success
    end
    it "loads a page" do
      get :edit, { :id => 1 }
      response.should have_selector("title", :content => "Agitracker: Edit admin")
    end
    it "contains a form" do
      get :edit, { :id => 1 }
      response.should have_selector("form")
    end

    describe "update a page" do
      before :each do
        @user = Factory.create(:user)
      end
      it "saves the changes" do
        post :update, { :id => @user, :user => { :name => "newname" } }
        User.find(@user.id).name.should == "newname"
        flash[:success].should_not be_nil
        response.should redirect_to(:action => :show, :id => assigns[:user].id)
      end
    end

  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
    it "loads a page" do
      get :new
      response.should have_selector("title", :content => "Agitracker: New user")
    end
    it "contains a form" do
      get :new
      response.should have_selector("form")
    end

    describe "creates a new user" do
      before :each do
        @user = Factory.build(:user)
      end
      it "saves created user" do
        expect{ post :create, {:user => Factory.attributes_for(:user)} }.to change(User, :count).by(+1)
        flash[:success].should_not be_nil
        response.should redirect_to(admin_users_path)
      end
    end

  end

  describe "GET 'destroy'" do
    it "deletes a user" do
      user = Factory.create(:user)
      expect{ delete :destroy, :id => user.id }.to change(User, :count).by(-1)
      flash[:success].should_not be_nil
      response.should redirect_to(admin_users_path)
    end
  end

end
