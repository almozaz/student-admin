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
end
