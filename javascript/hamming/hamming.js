module.exports = {
  compute: function(strand, oppositeStrand) {
    if (strand.length != oppositeStrand.length) {
      throw 'DNA strands must be of equal length.';
    }
    var difference = 0,
        strandLength = strand.length;
    for (var i = 0; i < strandLength; ++i) {
      if (strand[i] != oppositeStrand[i]) {
        difference++;
      }
    }
    return difference;
  }
};
