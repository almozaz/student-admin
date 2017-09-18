require 'rails_helper'

describe "shared/_navbar.html.erb" do
  before do
    sign_in user
    render
  end

  context "without profile" do
    let(:user) { create :user, email: "al@al.com" }

    it "renders email" do
      expect(rendered).to have_content("al@al.com")
      puts user.email
    end
  end

  context "with profile" do
    let(:profile) { build :profile, first_name: "Joe", last_name: "Smith" }
    let(:user) { create :user, profile: profile }

    it "renders first and last name" do
      expect(rendered).to have_content("Joe Smith")
    end
  end
end
