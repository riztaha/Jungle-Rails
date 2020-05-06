require "rails_helper"

RSpec.describe User, type: :model do
  subject {
    User.new(
      name: "Test Name",
      # last_name: "TestLastName",
      email: "test@abc.com",
      password: "testpass",
      password_confirmation: "testpass",
    )
  }

  describe "Validations" do

    # Tests are below:
    it "is valid with valid attributes... creates a new user if everything is filled out as above test case" do
      expect(subject).to be_valid
    end

    it "has entered a field in the name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "user has entered something in password field" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "has matching password and password confirmation fields" do
      subject.password = "abc123456"
      subject.password_confirmation = "12345ascjflskdajf"
      expect(subject).to_not be_valid
    end

    it "has entered a field in the email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "has entered an invalid password length" do
      subject.password = "a12"
      expect(subject).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    it "authenticates user with their email/pass" do
      subject.save
      subjectAuth = User.authenticate_with_credentials("test@abc.com", "testpass")
    end

    it "has a case-sensitive email" do
      subject.save
      subjectAuth = User.authenticate_with_credentials("TEST@ABC.com", "testpass")
      expect(subject).to eql(subjectAuth)
    end

    it "removes excess spaces from email beginning/end" do
      subject.save
      subjectAuth = User.authenticate_with_credentials("  test@abc.com    ", "testpass")
      expect(subject).to eql(subjectAuth)
    end
  end
end
