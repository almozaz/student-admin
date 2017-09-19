class MatchPair < ApplicationRecord
  belongs_to :user
  belongs_to :match, class_name: "User"

  after_create :create_inverse

  validates_uniqueness_of :user_id, scope: :match_id

  def create_inverse
    self.class.create(user_id: self.match.id, match_id: self.user.id)
  end

end
