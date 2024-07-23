namespace :json_to_model do
  desc "Generate models and migrations from JSON files"
  task :generate, [:source_folder, :target_folder, :module_name] => :environment do |t, args|
    require 'json'
    require 'fileutils'

    if args[:source_folder].nil? || args[:target_folder].nil? || args[:module_name].nil?
      puts "json_to_model:generate - you need to specify all arguments: source_folder, target_folder, module_name"
      exit(1)
    end

    source_folder = args[:source_folder]
    target_folder = args[:target_folder]
    module_name = args[:module_name]

    json_dir = Rails.root.join('lib', 'quiz_game_data', source_folder)

    Dir.glob("#{json_dir}/*.json").each do |file_path|
      file_name = File.basename(file_path, '.json')
      class_name = "#{file_name.split('_').collect(&:capitalize).join}Question"
      model_name = class_name.underscore
      namespaced_class_name = "#{module_name}::#{class_name}"

      json_data = JSON.parse(File.read(file_path))

      unless json_data.is_a?(Array) && json_data.first.is_a?(Hash)
        puts "Skipping #{file_name}: invalid JSON structure"
        next
      end

      # Define the columns for the migration
      columns = [
        "question:string",
        "options:text",
        "correct_answer:string"
      ]

      def class_exists?(name)
        begin
          name.constantize
          true
        rescue NameError
          false
        end
      end

      if class_exists?(namespaced_class_name)
        puts "#{namespaced_class_name}: model already exists"
        next
      end

      # Generate the model and migration without namespace
      system("rails generate model #{model_name} #{columns.join(' ')}")

      # Move the generated model file to the correct directory
      original_model_path = Rails.root.join('app', 'models', "#{model_name}.rb")
      target_model_dir = Rails.root.join('app', 'models', target_folder)
      FileUtils.mkdir_p(target_model_dir)
      target_model_path = target_model_dir.join("#{model_name}.rb")

      if File.exist?(original_model_path)
        File.write(target_model_path, <<~RUBY)
          module #{module_name}
            class #{class_name} < ApplicationRecord
            end
          end
        RUBY
        File.delete(original_model_path)
      end

      # Update the generated migration file
      migration_file_name = Dir.glob(Rails.root.join('db', 'migrate', "*_create_#{model_name.pluralize}.rb")).first
      if migration_file_name
        migration_content = File.read(migration_file_name)
        updated_content = migration_content.gsub(
          /t\.text :options/,
          't.text :options, array: true, default: []'
        )
        File.write(migration_file_name, updated_content)
      end

      puts "Generated model and migration for #{namespaced_class_name}"
    end
  end
end
