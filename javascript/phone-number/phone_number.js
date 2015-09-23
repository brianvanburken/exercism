module.exports = function PhoneNumber(phone) {
  var invalid = "0000000000";

  phone = phone.replace(/[^0-9]/g, '');
  if (phone.length < 10) phone = invalid;
  if (phone.length >= 11 && phone.substr(0, 1) !== "1") phone = invalid;
  if (phone.length >= 11) phone = phone.substr(1);

  return {
    areaCode: function() { return phone.substr(0, 3); },
    number:   function() { return phone; },
    toString: function() { return phone.replace(/.../, '($&) ').replace(/ .../, '$&-'); }
  };
};
