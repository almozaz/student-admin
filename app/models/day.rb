class Day < ApplicationRecord
  has_many :match_pairs

  validates :date, presence: true, uniqueness: true


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

  def self.today(date)
    today = Day.find_by(date: date)
    if today == nil
      new_day = Day.create(date: date)
      return new_day
    else
      return today
    end
  end

end
