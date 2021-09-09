class WheelsOnTheBus
  def song
    verses(1, 4)
  end

  def verses(start, end)
    start.upto(end).map{ |n| verse(n) }.join("\n")
  end

  def verse(number)
    case number:
    when 1:
      "The wheels on the bus go round and round;
      round and round;
      round and round.
      The wheels on the bus go round and round,
      all through the town."

    when 2:
      "The wipers on the bus go swish, swish, swish;
      Swish, swish, swish;
      Swish, swish, swish.
      The wipers on the bus go swish, swish, swish,
      all through the town."

    when 3:
      "The horn on the bus goes beep, beep, beep;
      Beep, beep, beep;
      Beep, beep, beep.
      The horn on the bus goes beep, beep, beep,
      all through the town."

    when 4:
      "The doors on the bus go open and shut;
      Open and shut;
      Open and shut.
      The doors on the bus go open and shut;
      all through the town."
  end
end