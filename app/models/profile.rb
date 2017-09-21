class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.return_student_ids
    student_profiles = Profile.where(admin: false)
    student_ids = []

    student_profiles.each do |profile|
      student_ids << profile.user_id
    end
    return student_ids
  end
end
