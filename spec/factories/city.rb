FactoryBot.define do
  factory :city do
    name { 'São Paulo' }
    state { build(:state) }
  end
end
