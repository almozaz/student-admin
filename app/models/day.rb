class Day < ApplicationRecord
  has_many :match_pairs

  validates :date, presence: true, uniqueness: true

  def todays_match_pairs
    match_pairs = self.match_pairs
    count = 0
    filtered_match_pairs = []

    match_pairs.each do |pair|
      count += 1
      if count % 2 == 0
        filtered_match_pairs << pair
      else
        next
      end
    end
    return filtered_match_pairs
  end
end
