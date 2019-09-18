FactoryBot.define do
  factory :step do
    name { "HTML Tutorial" }
    resource
    initialize_with { new(attributes) }
  end
  factory :unnamed_step, class: Step do
    name { nil }
    resource
    initialize_with { new(attributes) }
  end
end
