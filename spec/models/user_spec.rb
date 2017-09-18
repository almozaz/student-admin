require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User roles" do
    it "a new user is created as student by default"

    student = User.new

    expect(student.admin).to eq(false)
  end
end
