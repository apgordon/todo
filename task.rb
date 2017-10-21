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
			puts "Index: #{index}, Name: #{@@tasks[index].name}"
		end
	end


end

Task.create("buy milk")
Task.show_one(0)
Task.create("take out trash")
Task.show_one(1)
puts "\n\n"
Task.show_all