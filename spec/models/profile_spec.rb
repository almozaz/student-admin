require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "Profile validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "#full_name?" do
    let(:user) { create :user }
    let!(:profile) {create :profile, user: user }
    it "Check if returns full name in correct format" do
      expect(profile.full_name).to eq("#{profile.first_name} #{profile.last_name}")
    end
  end

  describe "Profile roles" do
    it "a new profile is created as student by default" do

      student = Profile.new

      expect(student.admin).to eq(false)
    end
  end
end
