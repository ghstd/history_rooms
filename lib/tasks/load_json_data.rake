namespace :load_json_data do
  desc "Load data from JSON files into the database"
  task :load, [:source_folder, :write_folder, :module_name] => :environment do |t, args|
    require 'json'

    if args[:source_folder].nil? || args[:write_folder].nil? || args[:module_name].nil?
      puts "load_json_data:load - you need to specify all arguments: source_folder, write_folder, module_name"
      exit(1)
    end

    source_folder = args[:source_folder]
    write_folder = args[:write_folder]
    module_name = args[:module_name]

    json_dir = Rails.root.join('lib', 'quiz_game_data', source_folder)

    Dir.glob("#{json_dir}/*.json").each do |file_path|
      file_name = File.basename(file_path, '.json')
      class_name = "#{file_name.split('_').collect(&:capitalize).join}Question"
      namespaced_class_name = "#{module_name}::#{class_name}"
      model_class = namespaced_class_name.constantize

      if model_class.all.count > 0

        json_file_content = File.read(file_path)
        json_file_name = File.basename(file_path)
        File.write(Rails.root.join('lib', 'quiz_game_data', write_folder, json_file_name), json_file_content)
        File.delete(file_path)

        puts "#{namespaced_class_name}: model already has data"
        next

      end

      json_data = JSON.parse(File.read(file_path))

      json_data.each do |entry|
        model_class.create!(
          question: entry['question'],
          options: entry['options'],
          correct_answer: entry['correct_answer']
        )
      end

      json_file_content = File.read(file_path)
      json_file_name = File.basename(file_path)
      File.write(Rails.root.join('lib', 'quiz_game_data', write_folder, json_file_name), json_file_content)
      File.delete(file_path)

      puts "Loaded data for #{namespaced_class_name}"
    end
  end
end
