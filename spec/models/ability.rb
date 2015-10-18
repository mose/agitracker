require 'spec_helper'
require "cancan/matchers"

describe Ability do
  let(:ability) { Ability.new(user) }

  describe "Guest user" do
    let(:user) { build(:user) }

    it "can read pages" do
      expect(ability).to be_able_to(:read, Page)
    end

    it "cannot update or destroy pages" do
      expect(ability).not_to be_able_to(:update, Page)
      expect(ability).not_to be_able_to(:destroy, Page)
    end

    it "cannot list users" do
      expect(ability).not_to be_able_to(:read, User)
    end
  end

  describe "Editor user" do
    let(:user) { build(:editor) }

    it "can update or destroy pages" do
      expect(ability).to be_able_to(:update, Page)
      expect(ability).to be_able_to(:destroy, Page)
    end

    it "cannot list users" do
      expect(ability).not_to be_able_to(:read, User)
    end
  end

end
