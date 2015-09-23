var Beer = function() {};

Beer.prototype.verse = function(amount) {
  return this._quantity(amount)+" "+this._container(amount)+" of beer on the wall, "+this._quantity(amount).toLowerCase()+" "+this._container(amount)+" of beer.\n" +
    this._action(amount)+", "+this._quantity(amount-1).toLowerCase()+" "+this._container(amount-1)+" of beer on the wall.\n";
};

Beer.prototype._quantity = function(amount) {
  if (amount === 0) return "No more";
  if (amount === -1) return ""+99;
  return ""+amount;
};

Beer.prototype._container = function(amount) {
  return amount === 1 ? "bottle" : "bottles";
};

Beer.prototype._action = function(amount) {
  return amount === 0 ? "Go to the store and buy some more" :
    "Take "+this._pronoun(amount)+" down and pass it around";
};

Beer.prototype._pronoun = function(amount) {
  return amount === 1 ? "it" : "one";
};

Beer.prototype.sing = function(start, end) {
  end = end || 0;
  var song = [];
  for (var i = start; i >= end; --i) {
    song.push( this.verse(i) );
  }
  return song.join("\n");
};

module.exports = new Beer();
