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
    roles    ["admin"]
  end

  factory :editor, :class => User do
    name     "editortest"
    email    "editortest@example.com"
    password "editortest"
    roles    ["editor"]
  end

  factory :developer, :class => User do
    name     "devtest"
    email    "devtest@example.com"
    password "devtest"
    roles    ["developer"]
  end

end
