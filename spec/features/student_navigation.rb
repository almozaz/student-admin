require 'rails_helper'

describe "Navigation" do
  before do
    login_as student
  end

  let(:student) { create :user }
  let(:student_profile) { create :profile, user: student }

  it "can only see calendar" do
    visit root_path

    expect(page).to have_text("Your match for today is:")

    expect(page).not_to have_text("View all users")
  end
end
