var School = function() {
  this.grades = {};
};

School.prototype.add = function(student, grade) {
  var students = this.grade(grade);
  students.push(student);
  this.grades[grade] = students.sort();
};

School.prototype.grade = function(grade) {
  return this.grades[grade] || [];
};

School.prototype.roster = function() {
  return this.grades;
};

module.exports = School;
