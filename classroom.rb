# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(grade_hash, student, assignment_num)
  grade_hash[student][assignment_num-1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(grade_hash, assignment_num)
  newArr = []
  grade_hash.each do |key, value|
    newArr.push(value[assignment_num-1])
  end
  newArr
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(grade_hash, assignment_num)
  newArr = []
  grade_hash.each do |key, value|
    newArr.push(value[assignment_num-1])
  end
  y = 0
  newArr.each do |x|
    y = y + x
  end
  y = y / newArr.length
  y
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
  newArr = []
  grade_hash.each do |key, value|
    y = 0
    x = 0
    value.each do |q|
      y = y + q
      x = x + 1
    end
    y = y/x
    newArr.push([key, y])
  end
  newArr.to_h
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
  grade = ""
  if score >= 90
    grade = "A"
  end
  if score >= 80 && score <90
    grade = "B"
  end
  if score >= 70 && score <80
    grade = "C"
  end
  if score >= 60 && score <70
    grade = "D"
  end
  if score < 60
    grade = "F"
  end
  grade
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(grade_hash)
  avgArr = averages(grade_hash)
  gradeArr = []
  avgArr.each do |key, value|
    gradeArr.push([key, letter_grade(value)])
  end
  gradeArr.to_h
end

# Return the average for the entire class.
def class_average(grade_hash)
  avgArr = averages(grade_hash)
  y = 0
  avgArr.each do |key, value|
    y = y + value
  end
  y = y/avgArr.length
  y
end

# Return an array of the top `number_of_students` students.
def top_students(grade_hash, number_of_students)
  avgArr = averages(grade_hash).sort_by {|key, value| value}
  topStudents = []
  actuallyTop = []
  i = avgArr.length-1
  while i >= avgArr.length-(number_of_students) do
    topStudents.push(avgArr[i])
    i = i -1
  end
  topStudents.each do |key, value|
    actuallyTop.push(key)
  end
  actuallyTop

end
