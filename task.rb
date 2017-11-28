class Task

	@@incomplete_tasks = []
	@@completed_tasks = []
	@@deleted_tasks = []
	@@sort_type = 'added'

	attr_accessor :name, :added

	def initialize(name)
		@name = name
		@added = Time.now
	end

	def self.create(name)
		@@incomplete_tasks << Task.new(name)
		puts "Task added."
		#should call sort method to properly sort
	end

	def self.show_one(index)
		puts "#{index}: #{@@incomplete_tasks[index].name}"
	end

	def self.list_all
		if @@incomplete_tasks.count == 0
			puts "No tasks here."
		else
			if @@sort_type == 'name'
				@@incomplete_tasks.sort_by!{|obj| obj.name}
			elsif @@sort_type == 'added'
				@@incomplete_tasks.sort_by!{|obj| obj.added}
			end
			@@incomplete_tasks.each_with_index do |i, index|
				puts "#{index}: #{@@incomplete_tasks[index].name}"
			end
		end
	end

	def self.set_sort(type)
		@@sort_type = type
		if @@sort_type == 'name'
			puts "Tasks sorted by name."
		elsif @@sort_type == 'added'
			puts "Tasks sorted by added date"
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

	def self.unknown_command
		puts "Unknown command entered."
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

	elsif input[0].downcase == 'set'
			if input[1].downcase == 'sort'
				Task.set_sort(input[2])
			end
			#need a rescue here in case input after set doesn't match if

	elsif input[0].downcase == 'exit'
		break

	elsif input[0].downcase == 'help'
		puts "Available Commands:"
		puts "- create [task]"
		puts "- list"
		puts "- complete [index number]"
		puts "- delete [index number]"
		puts "- set sort [added, name]"

	else
		Task.unknown_command
	end

print "\n"
end
