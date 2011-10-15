FactoryGirl.define do
  factory :ticket do
    title "A ticket"
    description "A ticket, nothing more"
    user
    project
  end
end
