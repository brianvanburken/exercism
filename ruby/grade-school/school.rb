class School

  def initialize
    @grades = {}
  end

  def add(name, grade)
    @grades[grade] = [] unless @grades.include? grade
    @grades[grade] << name
    @grades[grade].sort!
  end

  def grade(grade)
    @grades[grade] || []
  end

  def to_hash
    Hash[@grades.sort]
  end

end