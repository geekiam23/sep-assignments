class Node
  attr_accessor :name
  attr_accessor :film_actor
  attr_accessor :path

  def initialize(name)
    @name = name
    @path = []
  end

  def set_films(films)
    @film_actor = Hash.new
    films.each do |key, value|
      value.each do |node|
        if node.name == name
          @film_actor[key] = value
          @film_actor[key] -= [node]
        end
      end
    end
  end
end
