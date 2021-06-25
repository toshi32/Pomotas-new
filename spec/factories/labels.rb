FactoryBot.define do
  factory :label do
    name { "午前" }
  end
  factory :label2, class: "Label" do
    name { "午後" }
  end
  factory :label3, class: "Label" do
    name { "勉強" }
  end
end
