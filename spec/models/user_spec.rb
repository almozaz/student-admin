require 'rails_helper'

RSpec.describe User, type: :model do

  describe "User roles" do
    it "a new user is created as student by default" do

      student = User.new

      expect(student.admin).to eq(false)
    end
  end

  describe "has_profile?" do
    let!(:user) { create :user }
    let!(:profile) { create :profile, user: user }
    it "returns true if the user has a profile" do
      expect(user.has_profile?).to be(true)
    end
  end

end
