class Task

	@@tasks = []

	attr_accessor :name

	def initialize(name)
		@name = name
	end


	def self.create(name)
		@@tasks << Task.new(name)
	end

	def self.show_one(index)
		puts "#{index}: #{@@tasks[index].name}" 
	end

	def self.show_all
		@@tasks.each_with_index do |i, index|
			puts "#{index}: #{@@tasks[index].name}"
		end
	end

	def self.delete(index)
		@@tasks.delete_at(index)
	end

	def self.delete_all
		@@tasks.clear 
	end



end

Task.create("task0")
Task.create("task1")
Task.create("task2") 
Task.show_all
puts "delete all..."
Task.delete_all
puts "deleted all"
Task.show_all
Task.create("task0")
Task.show_all
# input=''
# until input == 'exit'
# 	print "Command: "
# 	input = gets.chomp
# end
