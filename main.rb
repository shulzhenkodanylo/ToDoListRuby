class TaskManager
    def initialize
      @tasks_list = []
    end
  
    def scanning
      gets.chomp
    end
  
    def get_index(index_string)
      index = index_string.to_i - 1
      raise 'Invalid input' unless index.between?(0, @tasks_list.size - 1)
  
      index
    end
  
    def command_chooser
      puts "    Commands    \n-add -remove -done -edit -open -quit "
      scanning
    end
  
    def task_list_printer
      @tasks_list.each_with_index do |task, index|
        puts "#{index + 1}) #{task}"
      end
    end
  
    def add_task
      puts 'Enter a task to add: '
      task_to_add = scanning
      @tasks_list << task_to_add
      task_list_printer
    end
  
    def remove_task
      puts 'Enter a task index to remove: '
      task_index_to_remove = scanning
      @tasks_list.delete_at(get_index(task_index_to_remove))
      task_list_printer
    end
  
    def done_task
      puts 'Enter a task index to done: '
      task_index_to_done = scanning
      task_to_done = @tasks_list[get_index(task_index_to_done)]
      unless task_to_done.include?(' - ✅')
        @tasks_list[get_index(task_index_to_done)] = "#{task_to_done} - ✅"
        task_list_printer
      else
        puts 'Task was already done or it is an invalid task'
      end
    end
  
    def edit_task
      puts 'Enter a task index to edit: '
      task_index_to_edit = scanning
      puts 'Enter new task: '
      task_edit = scanning
      @tasks_list[get_index(task_index_to_edit)] = task_edit
      task_list_printer
    end
  
    def run
      loop do
        case command_chooser
        when '-add'
          add_task
        when '-remove'
          remove_task
        when '-done'
          done_task
        when '-edit'
          edit_task
        when '-open'
          task_list_printer
        when '-quit'
          break
        else
          puts 'Incorrect input!!!'
        end
      end
    end
  end
  
  TaskManager.new.run