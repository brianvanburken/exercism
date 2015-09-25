var generatedNames = [];
function generateName() {
  var name = [
    String.fromCharCode(65 + Math.floor(Math.random() * 25)),
    String.fromCharCode(65 + Math.floor(Math.random() * 25)),
    Math.floor((Math.random() * 10)),
    Math.floor((Math.random() * 10)),
    Math.floor((Math.random() * 10))
  ].join('');
  if (generatedNames.indexOf(name) > -1) {
    return generateName();
  }
  generatedNames.push(name);
  return name;
}

var Robot = function() {
  this.name = generateName();
};

Robot.prototype.reset = function() {
  this.name = generateName();
};

module.exports = Robot;
