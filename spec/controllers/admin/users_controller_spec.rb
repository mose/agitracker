require 'spec_helper'

describe Admin::UsersController do
  render_views
  login_admin

  describe "lists users" do
    it "returns http success" do
      get :index
      expect(response).to be_success
    end
    it "loads a page" do
      get :index
      expect(response.body).to have_selector("title", :content => "Agitracker: Users list")
    end
    it "contains the default user" do
      get :index
      expect(response.body).to have_selector(".user-entry")
    end
  end

  describe "shows a user" do
    it "returns http success" do
      get :show, { :id => 1 }
      expect(response).to be_success
    end
    it "loads a page" do
      get :show, { :id => 1 }
      expect(response.body).to have_selector("title", :content => "Agitracker: Show admin")
    end

  end

  describe "edits a user" do
    it "returns http success" do
      get :edit, { :id => 1 }
      expect(response).to be_success
    end
    it "loads a page" do
      get :edit, { :id => 1 }
      expect(response.body).to have_selector("title", :content => "Agitracker: Edit admin")
    end
    it "contains a form" do
      get :edit, { :id => 1 }
      expect(response.body).to have_selector("form")
    end

    describe "updates a user" do
      before :each do
        @user = create(:user)
      end
      it "saves the changes if all is good" do
        post :update, { :id => @user, :name => "newname" }
        User.find(@user.id).name.should == "newname"
        flash[:success].should_not be_nil
        expect(response).to redirect_to(:action => :show, :id => assigns[:user].id)
      end
      it "refuses to save user if somthing is wrong" do
        post :update, { :id => @user,  :name => ""  }
        User.find(@user.id).name.should == @user.name
        flash[:failure].should_not be_nil
        expect(response).to be_success
      end
    end

  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      expect(response).to be_success
    end
    it "loads a page" do
      get :new
      expect(response.body).to have_selector("title", :content => "Agitracker: New user")
    end
    it "contains a form" do
      get :new
      expect(response.body).to have_selector("form")
    end

    describe "creates a new user" do
      before :each do
        @user = build(:user)
      end
      it "saves created user" do
        expect{ post :create, { name: 'bob', email: 'bob@bobo.eu', password: '12345678' } }.to change(User, :count).by(+1)
        flash[:success].should_not be_nil
        expect(response).to redirect_to(admin_users_path)
      end
    end

  end

  describe "GET 'destroy'" do
    it "deletes a user" do
      user = create(:user)
      expect{ delete :destroy, :id => user.id }.to change(User, :count).by(-1)
      flash[:success].should_not be_nil
      expect(response).to redirect_to(admin_users_path)
    end
  end

end
