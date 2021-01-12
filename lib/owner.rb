class Owner
  # code goes here

  attr_reader :name, :species#, :cats, :dogs

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    #@cats = []
    #@dogs = []
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    arr = Dog.all.select {|dog| dog.owner == self}

    arr.map do |d|
      d.mood = "happy"
    end
    
  end

  def feed_cats
    arr = Cat.all.select {|cat| cat.owner == self}

    arr.map do |c|
      c.mood = "happy"
    end

  end

  def sell_pets
    cat_arr = Cat.all.select {|cat| cat.owner == self}
    cat_arr.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end

    dog_arr = Dog.all.select {|dog| dog.owner == self}
    dog_arr.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end






end