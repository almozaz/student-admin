require 'rails_helper'

describe "Navigation" do

  yesterday_date = Date.yesterday
  today_date = Date.today

  let!(:student)            { create :user }
  let!(:student2)           { create :user }
  let!(:student3)           { create :user }
  let!(:dummy_student)      { create :user, id: 666 }
  let!(:student_profile)    { create :profile, first_name: "Danaerys", last_name: "Targaryan", admin: false, user: student }
  let!(:student_profile2)   { create :profile, first_name: "Jon", last_name: "Snow", admin: false, user: student2 }
  let!(:student_profile3)   { create :profile, first_name: "Robert", last_name: "Baratheon", admin: false, user: student3 }
  let!(:dummy_profile)      { create :profile, first_name: "Nobody", last_name: "at all", admin: nil, user: dummy_student }

  let!(:yesterday)          { create :day, date: yesterday_date }
  let!(:today)              { create :day, date: today_date }

  let!(:match_pair_yesterday)    { create :match_pair, user: student, match: student3, day: yesterday }
  let!(:match_pair_today)        { create :match_pair, user: student, match: student2, day: today }

  it "shows today's match" do
    login_as student

    visit root_path

    expect(page).to have_text("Your match for today is: Jon Snow")
  end

  it "shows past matches" do
    login_as student

    visit root_path

    expect(page).to have_text("Your match on #{yesterday_date} was Robert Baratheon")
  end
end
