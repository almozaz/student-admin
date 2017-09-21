class Day < ApplicationRecord
  has_many :match_pairs

  validates :date, uniqueness: true

end
