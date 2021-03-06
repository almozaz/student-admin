class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy

  has_many :match_pairs
  has_many :matches, through: :match_pairs

  def has_profile?
    profile.present? && profile.persisted?
  end

  def full_name
    profile.full_name
  end

  def todays_match
    today_date = Date.today
    today = Day.today(today_date)
    match_pair = self.match_pairs.find_by(day: today)

    if match_pair == nil
      matches_today = today.match_pairs
      if matches_today == []
        students = Profile.return_student_ids
        student_list = StudentList.create(list: students)
        Pairing.new(today, student_list)
        match_pair = self.match_pairs.find_by(day: today)
        match_name = match_pair.match_name
        return match_name
      else
        return "Nobody"
      end
    else
      match_name = match_pair.match_name
    end
    return match_name
  end

  def past_matches
    today_date = Date.today
    all_past_match_pairs = Day.where("date < #{today_date}").match_pairs
    

  end



end



# identify admins with:
# if current_user.admin?
#   # do something
# end

# grant admin status to user:
# user.update_attribute :admin, true
