namespace :change_models do
  desc "Update serialize options in app/models"
  task update_serialize_strings: :environment do
    dir = Rails.root.join('app', 'models')
    Dir.glob("#{dir}/*/**/*.rb").each do |file|
      content = File.read(file)
      updated_content = content.gsub("serialize :options, JSON", "  serialize :options, coder: JSON")
      File.write(file, updated_content)
    end
  end
end
