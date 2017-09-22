MatchPair.destroy_all
Profile.destroy_all
User.destroy_all
MatchPair.destroy_all

dummy = User.create!(id: 666, email: "nobody@nobody.com", password: "123456")
dummyprofile = Profile.create!(first_name: "Nobody", last_name: "at all", admin: nil, user: dummy)

admin1  = User.create!(email: "admin1@admin.com", password: "123456")
admin2  = User.create!(email: "admin2@admin.com", password: "123456")
admin3  = User.create!(email: "admin3@admin.com", password: "123456")

Profile.create!(first_name: Faker::Ancient.god, last_name: Faker::Name.suffix, admin: true, user: admin1)
Profile.create!(first_name: Faker::Ancient.god, last_name: Faker::Name.suffix, admin: true, user: admin2)
Profile.create!(first_name: Faker::Ancient.god, last_name: Faker::Name.suffix, admin: true, user: admin3)

student1 = User.create!(email: "student1@student.com", password: "123456")
student2 = User.create!(email: "student2@student.com", password: "123456")
student3 = User.create!(email: "student3@student.com", password: "123456")
student4 = User.create!(email: "student4@student.com", password: "123456")
# student5 = User.create!(email: "student5@student.com", password: "123456")
# student6 = User.create!(email: "student6@student.com", password: "123456")
# student7 = User.create!(email: "student7@student.com", password: "123456")
# student8 = User.create!(email: "student8@student.com", password: "123456")
# student9 = User.create!(email: "student9@student.com", password: "123456")
# student10 = User.create!(email: "student10@student.com", password: "123456")


Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student1)
Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student2)
Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student3)
Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student4)
# Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student5)
# Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student6)
# Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student7)
# Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student8)
# Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student9)
# Profile.create!(first_name: Faker::Ancient.hero, last_name: Faker::Name.suffix, admin: false, user: student10)


all_students = Profile.return_student_ids
StudentList.create!(list: all_students)
