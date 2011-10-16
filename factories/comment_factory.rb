FactoryGirl.define do
  factory :comment do
    text "A plain old boring comment."
    ticket
    user
  end
end
