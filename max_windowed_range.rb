class Array
	def naive_solution(w)
		windows = each_cons(w).to_a
		maxes = windows.map{|x| x.max}
		mins = windows.map{|x| x.min}
		maxes.zip(mins).map{|x,y| x-y}.max
	end

	def optimized_solution
	end

end

#p [1,2,3,5].naive_solution(3)
# p [1, 0, 2, 5, 4, 8].naive_solution(2) == 4 # 4, 8
# p [1, 0, 2, 5, 4, 8].naive_solution(3) == 5 # 0, 2, 5
# p [1, 0, 2, 5, 4, 8].naive_solution(4) == 6 # 2, 5, 4, 8
# p [1, 3, 2, 5, 4, 8].naive_solution(5) == 6 # 3, 2, 5, 4, 8

class MyStack
	def initialize
		@store =[]
	end

	def pop
		@store.pop
	end

	def push(x)
		@store.push(x)
	end

	def peek
		@store[-1]
	end

	def size
		@store.length
	end

	def empty?
		@store.empty?
	end


end

class MyStackQueue < MyStack

	def initialize
		@first_stack = MyStack.new
		@second_stack = MyStack.new
	end


	def enqueue(el)
		@first_stack.push(el)
	end

	def dequeue
		if @second_stack.empty?
		  @first_stack.size.times do
			  @second_stack.push(@first_stack.pop)
		  end
		end
		@second_stack.pop
	end

end

class MyMinMaxStack

	def initialize
		@stack = MyStack.new
  end

	def push(x)
		@stack.push({ value: x, max: new_max(x), min: new_min(x) })
  end

	def pop
    @stack.pop[:value]
	end

	def peek
    @stack.peek[:value]
	end

	def size
    @stack.size
	end

	def empty?
    @stack.size == 0
	end

	def min
    @stack.peek[:min] unless empty?
	end

	def max
    @stack.peek[:max] unless empty?
	end

	def new_max(value)
    empty? ? value : [value, max].max
	end

	def new_min(value)
    empty? ? value : [value, min].min
	end

end

class MyMinMaxStackQueue < MyMinMaxStack

	def initialize
		@first_stack = MyMinMaxStack.new
		@second_stack = MyMinMaxStack.new
	end


	def enqueue(el)
		@first_stack.push(el)
	end

	def dequeue
		if @second_stack.empty?
		  @first_stack.size.times do
			  @second_stack.push(@first_stack.pop)
		  end
		end
		@second_stack.pop
	end

end

my_min_max_stack_queue = MyMinMaxStackQueue.new

my_min_max_stack_queue.enqueue(1)
my_min_max_stack_queue.enqueue(0)
my_min_max_stack_queue.enqueue(2)
my_min_max_stack_queue.enqueue(5)
my_min_max_stack_queue.enqueue(4)
my_min_max_stack_queue.enqueue(8)
p my_min_max_stack_queue.dequeue
