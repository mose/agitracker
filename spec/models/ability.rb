require 'spec_helper'
require "cancan/matchers"

describe Ability do

  describe "Guest user" do
    before :each do
      @user = Factory.build(:user)
      @ability = Ability.new(@user)
    end

    it "can read pages" do
      @ability.should be_able_to(:read, Page)
    end

    it "cannot update or destroy pages" do
      @ability.should_not be_able_to(:update, Page)
      @ability.should_not be_able_to(:destroy, Page)
    end

    it "cannot list users" do
      @ability.should_not be_able_to(:read, User)
    end
  end

  describe "Editor user" do
    before :each do
      @user = Factory.build(:editor)
      @ability = Ability.new(@user)
    end

    it "can update or destroy pages" do
      @ability.should be_able_to(:update, Page)
      @ability.should be_able_to(:destroy, Page)
    end

    it "cannot list users" do
      @ability.should_not be_able_to(:read, User)
    end
  end

end
