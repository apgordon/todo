class Task

	@@incomplete_tasks = []
	@@completed_tasks = []
	@@deleted_tasks = []

	attr_accessor :name

	def initialize(name)
		@name = name
	end

	def self.create(name)
		@@incomplete_tasks << Task.new(name)
		puts "Task added."
	end

	def self.show_one(index)
		puts "#{index}: #{@@incomplete_tasks[index].name}"
	end

	def self.list_all
		if @@incomplete_tasks.count == 0
			puts "No tasks here."
		else
			@@incomplete_tasks.each_with_index do |i, index|
				puts "#{index}: #{@@incomplete_tasks[index].name}"
			end
		end
	end

	def self.list_deleted_all
		@@deleted_tasks.each_with_index do |i, index|
			puts "#{index}: #{@@deleted_tasks[index].name}"
		end
	end

	def self.list_completed_all
		@@completed_tasks.each_with_index do |i, index|
			puts "#{index}: #{@@completed_tasks[index].name}"
		end
	end

	def self.delete
		print "Delete which task? "
		index = gets.chomp.to_i
		@@deleted_tasks << @@incomplete_tasks[index]
		@@incomplete_tasks.delete_at(index)
		p @@deleted_tasks
	end

	def self.complete(index)
		@@completed_tasks << @@incomplete_tasks[index]
		@@incomplete_tasks.delete_at(index)
	end

	def self.delete_all
		@@incomplete_tasks.clear
	end

end

loop do
	print "Command: "
	input = gets.chomp.split(" ")

	if input[0].downcase == 'create'
		if input.count == 1
			print "Task name: "
			name = gets.chomp
		else
			name = input.drop(1).join(" ")
		end
		Task.create(name)

	elsif input[0].downcase == 'list'
		Task.list_all

	elsif input[0].downcase == 'delete'
		Task.delete

	elsif input[0].downcase == 'complete'
		if input.count == 1
			print "Complete which task? "
			index = gets.chomp.to_i
		else
			index = input[1].to_i
		end
		Task.complete(index)

	elsif input[0].downcase == 'exit'
		break

	else
		puts "Unknown command entered."
	end

print "\n"
end
