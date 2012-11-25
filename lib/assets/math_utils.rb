module MathUtils
  require DateTime


  $randGen = Random.new(DateTime.timeInMs)


  def MathUtils.nextRand
    $randGen.rand
  end

  def MathUtils.nextRand(max)
    $randGen.rand(max)
  end
end