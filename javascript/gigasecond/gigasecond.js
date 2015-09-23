module.exports = function(startDate) {
  var finalDate = new Date(new Date(Number(startDate) + 1e12).toDateString());
  this.date = function() {
    return finalDate;
  };
};
