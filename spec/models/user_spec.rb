require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:valid_attributes) {
    {
      :email => "user@bronxdefenders.org",
      :password => "password",
      :password_confirmation => "password"
    }
  }

  describe "email" do
    it "should create a new instance given valid attributes" do
      User.create!(valid_attributes)
    end

    it "should require an email address" do
      no_email_user = User.new(valid_attributes.merge(:email => ""))
      expect(no_email_user).to_not be_valid
    end

   it "should accept valid email addresses" do
      addresses = %w[name@bronxdefenders.org FIRST_LAST@BRONXDEFENDERS.ORG first.last@bronxdefenders.org]
      addresses.each do |address|
        user = User.new(valid_attributes.merge(:email => address))
        expect(user).to be_valid
      end
    end

    it "should reject invalid email addresses" do
      addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.nyc user@foo,com user_at_foo.org example.user@foo.]
      addresses.each do |address|
        user = User.new(valid_attributes.merge(:email => address))
        expect(user).to_not be_valid
      end
    end

    it "should accept administrator login" do
      user = User.new(valid_attributes.merge(:email => 'michaelprude@gmail.com'))
      expect(user).to be_valid
    end

    it "should reject duplicate email addresses" do
      User.create!(valid_attributes)
      duplicate_user = User.new(valid_attributes)
      expect(duplicate_user).to_not be_valid
    end

    it "should reject email addresses identical up to case" do
      upcased_email = valid_attributes[:email].upcase
      User.create!(valid_attributes.merge(:email => upcased_email))
      duplicate_user = User.new(valid_attributes)
      expect(duplicate_user).to_not be_valid
    end

  end
  describe "passwords" do

    let(:user) { User.new(valid_attributes) }

    it "should have a password attribute" do
      expect(user).to respond_to(:password)
    end

    it "should have a password confirmation attribute" do
      expect(user).to respond_to(:password_confirmation)
    end
  end

  describe "password validations" do

    it "should require a password" do
      user = User.new(valid_attributes.merge(:password => "", :password_confirmation => ""))
      expect(user).to_not be_valid
    end

    it "should require a matching password confirmation" do
      user = User.new(valid_attributes.merge(:password_confirmation => "invalid"))
      expect(user).to_not be_valid
    end
    it "should reject short passwords" do
      short_password = '12345'
      adequate_password = '123456'
      short_user = User.new(valid_attributes.merge(:password => short_password, :password_confirmation => short_password))
      adequate_user = User.new(
        valid_attributes.merge(:password => adequate_password, :password_confirmation => adequate_password)
      )
      expect(adequate_user).to be_valid
      expect(short_user).to_not be_valid
    end

  end

  describe "password encryption" do

    let(:user) { User.create!(valid_attributes) }

    it "should have an encrypted password attribute" do
      expect(user).to respond_to(:encrypted_password)
    end

    it "should set the encrypted password attribute" do
      expect(user.encrypted_password).to_not be_blank
    end
  end
end