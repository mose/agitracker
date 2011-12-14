FactoryGirl.define do

  factory :user do
    name     "momo"
    email    "momo@example.com"
    password "momopass"
  end

  factory :admin, :class => User do
    name     "admintest"
    email    "admintest@example.com"
    password "admintest"
  end

end
