
Profile.destroy_all
User.destroy_all

admin   = User.create!(email: "admin@admin.com", password: "123456")
student = User.create!(email: "student@student.com", password: "123456")

Profile.create!(first_name: "Arno", last_name: "Fleming", admin: true, user: admin)
Profile.create!(first_name: "Billy", last_name: "Boy", admin: false, user: student)
