require 'rails_helper'

describe "Navigation" do

  let!(:student)         { create :user }
  let!(:student_profile) { create :profile, admin: false, user: student }

  it "shows today's match" do
    login_as student

    visit root_path

    expect(page).to have_text("Your match for today is:")

    expect(page).not_to have_text("View all users")
  end
end
