var School = function() {
  this.grades = {};
};

School.prototype.add = function(student, grade) {
  this.grades[grade] = (this.grades[grade] || []);
  this.grades[grade].push(student);
  this.grades[grade] = this.grades[grade].sort();
};

School.prototype.grade = function(grade) {
  return this.grades[grade] || [];
};

School.prototype.roster = function() {
  return this.grades;
};

module.exports = School;
