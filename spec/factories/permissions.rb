# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :permissiom, :class => 'Permission' do
    action "MyString"
    subject_class "MyString"
    subject_id 1
  end
end
