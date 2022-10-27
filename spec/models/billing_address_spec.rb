require "rails_helper"

RSpec.describe BillingAddress, type: :model do
  describe "validations" do
    let(:params) do
      {
        name: "Alexander Hamilton",
        email_address: "punched@the.bursar",
        phone_number: "1234567890",
        street_address: "123 East Main St.",
        city: "Columbus",
        state: "OH",
        zip: "12345"
      }
    end

    it "is valid with valid attributes" do
      expect(described_class.new(params)).to be_valid
    end

    it "is invalid without a name" do
      instance = described_class.new(params)
      instance.name = nil

      expect(instance).to be_invalid
    end

    it "is invalid without a well formatted email_address" do
      instance = described_class.new(params)
      instance.email_address = nil

      expect(instance).to be_invalid

      instance.email_address = "hello"

      expect(instance).to be_invalid
    end

    it "is invalid without a well formatted phone_number" do
      instance = described_class.new(params)
      instance.phone_number = nil

      expect(instance).to be_invalid

      instance.phone_number = "1234567"

      expect(instance).to be_invalid
    end

    it "is invalid without a street_address" do
      instance = described_class.new(params)
      instance.street_address = nil

      expect(instance).to be_invalid
    end

    it "is invalid without a city" do
      instance = described_class.new(params)
      instance.city = nil

      expect(instance).to be_invalid
    end

    it "is invalid without a well formatted state" do
      instance = described_class.new(params)
      instance.state = nil

      expect(instance).to be_invalid

      instance.state = "ZZ"

      expect(instance).to be_invalid
    end

    it "is invalid without a well formatted zip" do
      instance = described_class.new(params)
      instance.zip = nil

      expect(instance).to be_invalid

      instance.zip = "123"

      expect(instance).to be_invalid
    end
  end
end
