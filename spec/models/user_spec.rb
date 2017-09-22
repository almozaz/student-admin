require 'rails_helper'

RSpec.describe User, type: :model do

  describe "association with profile" do
    let(:user) { create :user }
    let!(:profile) { create :profile, user: user }

    it "has profile" do
      expect(user.profile).to eq(profile)
    end

    it "deletes associate profile" do
      expect { user.destroy }.to change( Profile, :count).by(-1)
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
