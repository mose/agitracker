require 'spec_helper'

describe ApplicationController do

  describe "access unauthorized page" do

    it "fails miserably" do
      get :show, { :controller => Admin::User, :action => :index }
      flash[:error].should_not be_nil
      response.should redirect_to root_url
    end

  end

end
