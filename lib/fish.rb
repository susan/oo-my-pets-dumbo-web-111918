class Fish
  # code goes here
  attr_accessor :mood, :owner
  attr_reader :name 

  def initialize(name)
  	@name = name
  	#mood = nervous #don't need mood if have instance variable @mood
  	@mood = "nervous"
  end	
end