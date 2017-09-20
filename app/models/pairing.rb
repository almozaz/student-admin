class Pairing

  def get_students
    students = Profile.where(admin: false).ids
  end

  def randomize_order(students)
    students = students.shuffle
  end

  def remove_odd_one
    if students.count % 2 = 1
      extra_student = students.pop
    end
  end

  def pair_users
    pairs = students.each_slice(2).to_a
  end

  def more_possibilities?
    # check when no more possible matches
    #
  end

  def upgrade_index
    # match_pair.index ++
  end

end
