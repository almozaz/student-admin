class MatchPair < ApplicationRecord
  belongs_to :user
  belongs_to :match, class_name: "User"
  belongs_to :day

  after_create :create_inverse, unless: :has_inverse?

  # validates_uniqueness_of :user_id, scope: :match_id

  def create_inverse
    self.class.create(inverse_match)
  end

  def has_inverse?
    self.class.exists?(inverse_match)
  end

  def inverses
    self.class.where(inverse_match)
  end

  def inverse_match
    { match_id: user_id, user_id: match_id, day: day }
  end

  def user_name
    user_name = Profile.find_by(user_id: self.user_id).full_name
    return user_name
  end

  def match_name
    match_name = Profile.find_by(user_id: self.match_id).full_name
    return match_name
  end

end
