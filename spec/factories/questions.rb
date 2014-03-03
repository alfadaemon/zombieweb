# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    level nil
    category nil
    question "MyString"
  end
end
