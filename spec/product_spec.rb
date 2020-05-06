require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    # validation tests/examples here
    test_category = Category.new(name: "Test Category")
    subject {
      Product.new(
        name: "Test Product",
        price: 15000,
        quantity: 4,
        category: test_category,
      )
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "must have a valid name" do
      expect(subject.name).to be_present
    end

    it "must have a valid price" do
      expect(subject.price).to be_present
    end

    it "must have a quantity" do
      expect(subject.quantity).to be_present
    end

    it "must have a valid category name" do
      expect(subject.category).to be_present
    end

    it "is not valid without a category" do
      subject.category = nil
      #   puts subject.category
      expect(subject).to_not be_valid
    end

    it "should expect an error" do
      subject.category = nil
      subject.save
      #   puts subject.errors
      expect(subject.errors.full_messages).to be_present
    end
  end
end
