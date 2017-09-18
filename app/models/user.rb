class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

# identify admins with:
# if current_user.admin?
#   # do something
# end

# grant admin status to user:
# user.update_attribute :admin, true
