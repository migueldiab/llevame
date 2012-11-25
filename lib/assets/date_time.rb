module DateTime

  #     DateTime.timeInMs -> integer
  #
  # Returns the current time in miliseconds as an integer value 
  #
  # Returns an <code>Integer</code> initialized to the current system
  # time.
  #
  #
  def DateTime.timeInMs
    time = Time.new    
    floatTime = 1000 * time.to_f
    floatTime.to_i
  end
end