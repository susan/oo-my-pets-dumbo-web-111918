require 'pry'
class Owner
	attr_accessor :pets
	attr_reader :species, :name
  
  @@all_owners = []
  @@owner_count = 0
  
  
  def initialize(pets)
  	@species = "human"
  	@pets = pets
  	@pets = {}
  	@pets = {fishes: [], cats: [], dogs: []}
    @@all_owners << self
  end
   
   def self.all
   	@@all_owners
   end	

   def self.count
   	@@owner_count = @@all_owners.length
   end	

   def self.reset_all
   	@@all_owners.clear
   end	
   
   def say_species
  	 "I am a human."
   end	

   def name=(name)
   	  @name = name
   end	

   def buy_fish(fish_name)
   	 fish = Fish.new(fish_name)
     #fish.owner = self, when would this be needed?
     self.pets[:fishes] << fish
    end
    
    def buy_cat(cat_name)
   	 cat = Cat.new(cat_name)
     self.pets[:cats] << cat
    end

    def buy_dog(dog_name)
   	 dog = Dog.new(dog_name)
     self.pets[:dogs] << dog
    end
    
    def walk_dogs
    	self.pets[:dogs].each do |dog|
    	  dog.mood = "happy"
    	end 
    end	  

    def play_with_cats
      self.pets[:cats].each do |cat|
        cat.mood = "happy" 
      end
     end   
     # 
    def feed_fish
      self.pets[:fishes].each do |fish|
        fish.mood = "happy" 
      end 
    end   

     def sell_pets
     	@pets.each do |type, pets|
     		pets.each do |pet|
     			pet.mood = "nervous"
     		end
     	end		
      @pets.each do |type, pets|
      	pets.clear
      end	
     end	   
     
     def list_pets
     	pets_phrase = []
     	 sentence = "I have"
     	 @pets.each do |type, pets|
     	 	pets_phrase << " #{pets.length} #{type},"
          #sentence = sentence + "#{pets.length} #{type},"
     	 end
     	 sentence = sentence.concat(pets_phrase[0]).concat(pets_phrase[2]).concat(pets_phrase[1])
     	 sentence = sentence.gsub("fishes","fish").gsub("cats", "cat(s)").gsub("dogs", "dog(s)")
       sentence = sentence = sentence.insert(-10, "and ")
       sentence = sentence.strip.chomp(",") + "."
     end    
end

 