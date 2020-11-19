class Owner
  # code goes here
  attr_reader :name, :species
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    p "I am a human."
  end
  def self.all
    @@all
  end
  def self.count
     @@all.count
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select{|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  def buy_cat(name)
    Cat.new(name,self)
  end
  def buy_dog(name)
    Dog.new(name,self)
  end
  def walk_dogs
    self.dogs.each do
      |dog| dog.mood = "happy"
    end
  end
  def feed_cats
    self.cats.each do
      |cat| cat.mood = "happy"
    end
  end
  def sell_pets
    self.dogs.each do
      |dog| dog.mood = "nervous" 
    end
    self.cats.each do
      |cat| cat.mood = "nervous"
    end
    self.dogs.each do
     |dog| dog.owner = nil
    end
    self.cats.each do
      |cat| cat.owner = nil
    end

  end
  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end

# "I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)."