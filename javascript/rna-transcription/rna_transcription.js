module.exports = function(strand) {
  return strand.replace(/./g, function(nucleotide) {
    var nicleotideMapping = { C: 'G', G: 'C', A: 'U', T: 'A' };
    return nicleotideMapping[nucleotide];
  });
};
