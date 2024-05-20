class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class



  def self.create_encrypted_url(user_id, resource_id)
    data = "#{user_id}::#{resource_id}"
    lenght = ActiveSupport::MessageEncryptor.key_len
    salt  = SecureRandom.hex lenght
    secret = Rails.application.secret_key_base
    key = ActiveSupport::KeyGenerator.new(secret).generate_key salt, lenght
    crypt_object = ActiveSupport::MessageEncryptor.new key
    encrypted_data = crypt_object.encrypt_and_sign data
    return "#{salt}::#{encrypted_data}".gsub('+', '%2B')
  end

  def self.decrypt_url(url)
    salt, encrypted_data = url.split "::"
    lenght = ActiveSupport::MessageEncryptor.key_len
    secret = Rails.application.secret_key_base
    key = ActiveSupport::KeyGenerator.new(secret).generate_key salt, lenght
    crypt_object = ActiveSupport::MessageEncryptor.new key
    decrypted_data = crypt_object.decrypt_and_verify encrypted_data
    return decrypted_data.split "::"
  end

  # ======================================================

  def self.json_to_db(model, path)
    json_data = File.read(path)
    data = JSON.parse(json_data)

    data.each do |q|
      Object.const_get(model).create(question: q['question'], options: q['options'], answer: q['answer'])
    end
  end

end
