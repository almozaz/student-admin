class Pairing

  def initialize
    self.get_students
    self.randomize_order
    self.remove_odd_one
    self.pair_users
    self.create_pairs
  end

  def get_students
    @students = Profile.where(admin: false).ids
  end

  def randomize_order
    @students = @students.shuffle
  end

  def remove_odd_one
    if @students.count % 2 == 1
      @extra_student = @students.pop
    end
  end

  def pair_users
    @pairs = @students.each_slice(2).to_a
  end

  def create_pairs
    @pairs.each do |pair|
      student = pair[0]
      match = pair[1]

      new_match = MatchPair.new
      new_match.user_id = student
      new_match.match_id = match
      new_match.save
    end
  end

  def more_possibilities?
    # check when no more possible matches
    #
  end

  def upgrade_index
    # match_pair.index ++
  end

end
