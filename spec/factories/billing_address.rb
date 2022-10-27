FactoryBot.define do
  factory :billing_address, class: BillingAddress do
    name { "Alexander Hamilton" }
    email_address { "millionthings@justyou.wait" }
    phone_number { "5555555555" }
    street_address { "123 East Main St." }
    city { "Columbus" }
    state { "OH" }
    zip { "43068" }
  end
end
