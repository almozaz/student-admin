require 'rails_helper'

RSpec.describe Day, type: :model do

  describe "Day validations" do

    it { should validate_presence_of(:date) }
    it { should validate_uniqueness_of(:date) }

  end

end
