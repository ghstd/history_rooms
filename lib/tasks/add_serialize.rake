namespace :update_correct_answer do
  desc "Update correct_answer field in JSON objects"
  task run: :environment do
    file_path = Rails.root.join('lib', 'quiz_game_data', 'cohere_ai_questions', 'who_said_questions.json')
    json_data = JSON.parse(File.read(file_path))

    json_data.each do |object|
      correct_answer_index = object['correct_answer'][0]
      correct_answer_text = object['options'][correct_answer_index]
      object['correct_answer'] = correct_answer_text
    end

    File.write(file_path, JSON.pretty_generate(json_data))
  end
end
