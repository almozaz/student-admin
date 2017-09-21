class Pairing

DUMMY_STUDENT = User.find(666)

  def initialize(day, student_list)
    students = eval(student_list.list)
    old_list = eval(student_list.list)
    @day = day.id

    create_pairs(day, students)
    rotate_student_list(old_list)
  end

  def create_pairs(day, students)
    byebug
    students.push(DUMMY_STUDENT.id) if students.size.odd?
    byebug
    amount_of_pairs = students.size / 2

    resulting_pairs = []

    amount_of_pairs.times do |index|
      resulting_pairs << [students[index], students.reverse[index]]
    end
    match_pairs(day, resulting_pairs)
    byebug
  end

  def match_pairs(day, resulting_pairs)
    resulting_pairs.each do |pair|
      student = pair[0]
      match = pair[1]
      byebug
      new_match_pair = MatchPair.create(user_id: student, match_id: match, day: day)
      puts new_match_pair.errors.full_messages
    end
  end

  def rotate_student_list(old_list)

    new_student_list = [old_list[0]] + old_list[1..-1].rotate(-1)

    StudentList.create(list: new_student_list)
  end
end
