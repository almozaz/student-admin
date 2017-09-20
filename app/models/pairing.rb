class Pairing

  def initialize
    self.get_students

    @pairs_per_round = @students.size / 2
    @results = []
  end

  def get_students
    @students = Profile.where(admin: false).ids
    @students.push(nil) if @students.size.odd?
  end

  def create_pairs
    @pairs_per_round.times do |index|
      @results << [@students[index], @students.reverse[index]]
    end
  end

  def match_pairs
    @results.each do |pair|
      student = pair[0]
      match = pair[1]
      MatchPair.create(user_id: student, match_id: match)
    end
  end

  def rotate
    @students = [@students[0]] + @students[1..-1].rotate(-1)
    @results = []
  end

end
