require 'rails_helper'

describe "Navigation" do

  let!(:student)            { create :user }
  let!(:student2)           { create :user }
  let!(:dummy_student)      { create :user, id: 666 }
  let!(:student_profile)    { create :profile, first_name: "Danaerys", last_name: "Targaryan", admin: false, user: student }
  let!(:student_profile2)   { create :profile, first_name: "Jon", last_name: "Snow", admin: false, user: student2 }
  let!(:dummy_profile)      {create :profile, first_name: "Nobodoy", last_name: "at all", admin: nil, user: dummy_student }

  it "shows today's match" do
    login_as student

    visit root_path

    expect(page).to have_text("Your match for today is: Jon Snow")
  end
end
