require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "must be created with a password and password_confirmation fields" do
      @user = User.new(name: "Rachel",email: "test@test.com",password:"test",password_confirmation: "test")
      @user.save
      expect(@user).to be_present
    end
    it "validates name field is not blank" do
      @user = User.new(name: nil,email: "test@test.com",password:"test",password_confirmation: "test")
      @user.save
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it "validates email field is not blank" do
      @user = User.new(name: "Rachel",email: nil,password:"test",password_confirmation: "test")
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "validates password field is not blank/nil" do
      @user = User.new(name: "Rachel",email: "test@test.com",password: nil,password_confirmation: "test")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "validates password fields match" do
      @user = User.new(name: "Rachel",email: "test@test.com",password:"test",password_confirmation: "test1")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "validates email is unique" do
      @user1 = User.new(name: "Rachel",email: "test@test.com",password:"test",password_confirmation: "test")
      @user2 = User.new(name: "Tachel",email: "test@test.com",password:"test",password_confirmation: "test")
      @user1.save
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it "validates password is not less than 3 characters" do
      @user = User.new(name: "Rachel",email: "test@test.com",password:"te",password_confirmation: "te")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end
  end


  describe "authenticate_with_credentials" do
    it "should allow user to login with valid credentials" do
      @user = User.new(name: "Rachel",email: "test@test.com",password:"test",password_confirmation: "test")
      @user.save
      @user = User.authenticate_with_credentials("test@test.com","test")
      expect(@user).not_to be(nil)
    end
    it "should not allow user to login with invalid credentials" do
      @user = User.new(name: "Rachel",email: "test@test.com",password:"test",password_confirmation: "test")
      @user.save
      @user = User.authenticate_with_credentials("test@test.com","test1")
      expect(@user).to be(nil)
    end
    it "should allow user to login with white spaces in email" do
      @user = User.new(name: "Rachel",email: "test@test.com",password:"test",password_confirmation: "test")
      @user.save
      @user = User.authenticate_with_credentials(" test@test.com ","test")
      expect(@user).not_to be(nil)
    end
    it "should allow user to login with wrong case in email" do
      @user = User.new(name: "Rachel",email: "test@test.com",password:"test",password_confirmation: "test")
      @user.save
      @user = User.authenticate_with_credentials("TeSt@tEsT.coM","test")
      expect(@user).not_to be(nil)
    end
  end
end
