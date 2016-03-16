# Create a MyStack class in Ruby.
# Write push(element), pop, and empty? functions.


class MyStack
	def initialize
		@stack = []
	end

	def pop
		@stack.pop
	end

	def push(value)
		@stack.push(value)
	end

	def empty?
		@stack == []
	end
end

# Create a MyQueue class in Ruby.
# Write enqueue(element), dequeue, and empty? functions.

class MyQueue
	def initialize
		@queue = []
	end


	def enqueue(value)
		@queue << value
	end


	def dequeue
		@queue.shift
	end

	def empty?
		@stack == []
	end
end


# Create an alternative Queue class: StackQueue.
# Use two MyStack objects to implement enqueue(element), dequeue, and empty? functions.

class StackQueue
	def initialize
		@queue = MyStack.new
	end


	def enqueue(value)
		@queue.push(value)
	end


	def dequeue
		tempQueue = MyStack.new

		while(!@queue.empty?)
			tempQueue.push(@queue.pop)
		end

		release = tempQueue.pop

		while(!tempQueue.empty?)
			@queue.push(tempQueue.pop)
		end

		release
	end

	def empty?
		@queue.empty?
	end
end


# Create an alternative Stack class: QueueStack.
# Use two MyQueue objects to implement push(element), pop, and empty? functions.


class QueueStack

	def initialize
		@stack = MyQueue.new
	end


	def pop
		tempQueue = MyQueue.new

		while(!@stack.empty?)
			tempQueue.enqueue(@queue.dequeue)
		end

		release = tempQueue.dequeue

		while(!tempQueue.empty?)
			@stack.enqueue(tempQueue.dequeue)
		end

		release
	end

	def push(item)
		@stack.enqueue(item)
	end

	def empty?
		@stack.empty?
	end
end