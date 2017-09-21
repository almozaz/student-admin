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
end

# identify admins with:
# if current_user.admin?
#   # do something
# end

# grant admin status to user:
# user.update_attribute :admin, true
