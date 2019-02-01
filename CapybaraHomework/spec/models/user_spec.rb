require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password)}
  end
  
  describe "methods" do
    subject(:user)  {User.create(email: "123@11.com", password: 'needle')}
    
    describe "#is_password?" do
      it "should verify a correct password" do
        expect(user.is_password?('needle')).to be true
      end
    end

    describe "#reset_session_token" do
      it "should reset the session token" do
        old_session_token = user.session_token
        user.reset_session_token!
        expect(user.session_token).to_not eq(old_session_token)
      end
    end

    describe ".find_by_credentials" do
      before { user.save! }

      it "returns user gif credentials are correct" do
        expect(User.find_by_credentials("123@11.com", "needle")).to eq(user)
      end

      it "returns nil given if incorrect credentials" do
        expect(User.find_by_credentials("123@11.com", "password")).to eq(nil)
      end
  end


  end

end
