class Day < ApplicationRecord
  has_many :match_pairs

  validates :date, uniqueness: true


  def self.start_time
    Time.zone.at(self.date.to_time).to_datetime
    # self.date.to_datetime
  end

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
