class Pairing
  @@index = 1
  @date = Date.today
  cattr_accessor :pairs

  def initialize
    self.get_students
    self.randomize_order
    self.remove_odd_one
    self.pair_users
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
    @pairs.each_index do |index|
      student = @pairs[index][0]
      match = @pairs[index][1]
      x = MatchPair.new
      x.user_id = student
      x.match_id = match
      x.date = @date
      x.save
      if x.save

      end
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
