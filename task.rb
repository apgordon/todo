class Task

	@@tasks = []

	attr_accessor :name

	def initialize(name)
		@name = name
	end


	def self.create(name)
		@@tasks << Task.new(name)
	end

	def self.show_all
		@@tasks.each do|x|
			puts "#{x.name}"
		end
	end

end

Task.create("test task")
Task.create("another test task")
Task.show_all