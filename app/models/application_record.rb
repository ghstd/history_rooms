class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class



  def self.json_to_db(model, path)
    json_data = File.read(path)
    data = JSON.parse(json_data)

    data.each do |q|
      Object.const_get(model).create(question: q['question'], options: q['options'], answer: q['answer'])
    end
  end

end
