require 'rails_helper'

describe "Navigation" do
  before do
    login_as teacher
  end

  let(:teacher) { create :user, admin: true }
  let(:teacher_profile) { create :profile, user: teacher }

  it "shows member list and calendar" do
    visit root_path

    expect(page).to have_text("Go to calendar")

    expect(page).to have_text("View all users")
  end

  it "navigate to profile list" do
    visit root_path

    click_link "View all users"

    expect(page).to have_text("Teachers")

    expect(page).to have_text("Students")
  end
end
