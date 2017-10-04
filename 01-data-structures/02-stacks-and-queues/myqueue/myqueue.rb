class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    @queue[@queue.length] = element
    self.head = @queue[0]
    self.tail = @queue[@queue.length - 1]
  end

  def dequeue
    temp = @queue[0]
    @queue.shift
    temp
  end

  def empty?
    @queue.length == 0
  end
end
