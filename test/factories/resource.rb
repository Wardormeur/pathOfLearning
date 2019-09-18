FactoryBot.define do
  factory :resource do
    name { "My tutorial" }
    url { "http://google.com" }
    type_of { "pdf" }
  end
end
