namespace :add_new_json do
  desc "Runs json_to_model:generate, db:migrate, load_json_data:load in sequence"
  task :run, [:source_folder, :target_folder, :module_name, :write_folder] => :environment do |t, args|

    if args[:source_folder].nil? || args[:target_folder].nil? || args[:module_name].nil? || args[:write_folder].nil?
      puts "json_to_model:generate - you need to specify all arguments: source_folder, target_folder, module_name, write_folder"
      exit
    end

    source_folder = args[:source_folder]
    target_folder = args[:target_folder]
    module_name = args[:module_name]
    write_folder = args[:write_folder]

    begin
      puts "Starting json_to_model:generate..."
      system("rails json_to_model:generate[#{source_folder},#{target_folder},#{module_name}]")
      if $?.exitstatus == 0
        puts "Task succeeded"
      else
        puts "Task failed"
        exit
      end
    rescue StandardError => e
      puts "Error occurred in json_to_model:generate: #{e.message}"
      exit
    end

    begin
      puts "Starting db:migrate..."
      system("rails db:migrate")
      if $?.exitstatus == 0
        puts "Task succeeded"
      else
        puts "Task failed"
        exit
      end
    rescue StandardError => e
      puts "Error occurred in db:migrate: #{e.message}"
      exit
    end

    begin
      puts "Starting load_json_data:load..."
      system("rails load_json_data:load[#{source_folder},#{write_folder},#{module_name}]")
      if $?.exitstatus == 0
        puts "Task succeeded"
      else
        puts "Task failed"
        exit
      end
    rescue StandardError => e
      puts "Error occurred in load_json_data:load: #{e.message}"
      exit
    end

    puts "All tasks completed!"

  end
end
