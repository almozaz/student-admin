require 'rails_helper'

RSpec.describe Profile, type: :model do

  describe "Profile validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

end
