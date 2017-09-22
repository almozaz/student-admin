class Day < ApplicationRecord
  has_many :match_pairs

  validates :date, presence: true, uniqueness: true


  def self.only_past_days
    today_date = Date.today
    past_days = Day.where("date <= ?", today_date)
    return past_days
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

  def self.auto_generate_pairs
    today_date = Date.today
    today = Day.find_by(date: today_date)
    if today == nil
      new_day = Day.create(date: today_date)
      Pairing.new(new_day, StudentList.last)
    end
  end

end
