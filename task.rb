class Task

	@@tasks = []

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def self.create
		print "Task name: "
		name = gets.chomp
		@@tasks << Task.new(name)
	end

	def self.show_one(index)
		puts "#{index}: #{@@tasks[index].name}"
	end

	def self.list_all
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

loop do
	print "Command: "
	input = gets.downcase.chomp
	case input
	when "exit"
		break
	when "create"
		Task.create
		print "\n"
	when "list"
		Task.list_all
		print "\n"
	end
end
