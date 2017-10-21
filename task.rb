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


end

Task.create("buy milk")
Task.create("take out trash")
Task.show_all
puts "\n"
Task.delete(0)
Task.show_all