namespace :load_json_data do
  desc "Load data from JSON files into the database"
  task load: :environment do
    require 'json'

    json_dir = Rails.root.join('lib', 'quiz_game_data', 'gpt4_ai_questions')

    Dir.glob("#{json_dir}/*.json").each do |file_path|
      file_name = File.basename(file_path, '.json')
      class_name = "#{file_name.split('_').collect(&:capitalize).join}Question"
      namespaced_class_name = "Gpt4AiQuestions::#{class_name}"
      model_class = namespaced_class_name.constantize

      json_data = JSON.parse(File.read(file_path))

      json_data.each do |entry|
        model_class.create!(
          question: entry['question'],
          options: entry['options'],
          correct_answer: entry['correct_answer']
        )
      end

      puts "Loaded data for #{namespaced_class_name}"
    end
  end
end
