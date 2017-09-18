Profile.destroy_all
User.destroy_all

admin   = User.create!(email: "admin@admin.com", password: "123456", admin: true)
student = User.create!(email: "student@student.com", password: "123456", admin: false)

admin_profile = Profile.create!(first_name: "John", last_name: "Doe", user: admin)
student_profile = Profile.create!(first_name: "Jane", last_name: "Doe", user: student)
