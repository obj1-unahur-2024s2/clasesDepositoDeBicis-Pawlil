object pepita {
  var energy = 101

  method energy() = energy

  method fly(minutes) {
    energy = energy - minutes * 4
  }
}