module ControllerAuth
  def login_admin
    before(:each) do
      setup_controller_for_warden
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Factory.create(:admin)
    end
  end

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in Factory.create(:user)
    end
  end
end

RSpec.configure do |config|
  config.extend ControllerAuth, :type => :controller
end
