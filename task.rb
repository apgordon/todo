class Task

	@@incomplete_tasks = []
	@@deleted_tasks = []

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def self.create
		print "Task name: "
		name = gets.chomp
		@@incomplete_tasks << Task.new(name)
	end

	def self.show_one(index)
		puts "#{index}: #{@@incomplete_tasks[index].name}"
	end

	def self.list_all
		@@incomplete_tasks.each_with_index do |i, index|
			puts "#{index}: #{@@incomplete_tasks[index].name}"
		end
	end

	def self.list_deleted_all
		@@deleted_tasks.each_with_index do |i, index|
			puts "#{index}: #{@@deleted_tasks[index].name}"
		end
	end

	def self.delete
		print "Delete which task? "
		index = gets.chomp.to_i
		@@deleted_tasks << @@incomplete_tasks[index]
		@@incomplete_tasks.delete_at(index)
		p @@deleted_tasks
	end

	def self.delete_all
		@@incomplete_tasks.clear
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
	when "list"
		Task.list_all
	when "list deleted"
		Task.list_deleted_all
	when "delete"
		Task.delete
	end
print "\n"
end
