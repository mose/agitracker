require 'spec_helper'

describe User do
  describe "the 'Name' attribute" do
    let(:user) { build(:user) }
    it "should exist on the User model" do
      expect(user).to respond_to(:name)
      expect(user).to respond_to(:name=)
    end
    it "should be unique" do
      user.save
      user2 = build(:user, :email=>'diff@example.com')
      expect(user2.valid?).to be_falsey
      expect(user2.errors[:name]).to include("has already been taken")
    end
    it "should be required" do
      user.name = nil
      expect(user.valid?).to be_falsey
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end
