var Bob = function() {};

Bob.prototype.hey = function(greeting) {
  function yell(greeting) {
    return greeting === greeting.toUpperCase() && /[A-Z]/.test(greeting);
  }

  function mute(greeting) {
    return !greeting;
  }

  function question(greeting) {
    return greeting.slice(-1) === '?';
  }

  greeting = greeting.trim();
  if (mute(greeting))     { return "Fine. Be that way!"; }
  if (yell(greeting))     { return "Whoa, chill out!"; }
  if (question(greeting)) { return "Sure."; }
  return "Whatever.";
};

module.exports = Bob;
