# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(255)      not null
#  password           :string(255)
#  encrypted_password :string(255)
#  password_hash      :string(255)
#  salt               :string(255)
#  email_address      :string(255)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  login_token        :string(255)
#

require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  before_save :encrypt_password
  after_save :clear_password

  attr_accessible :password,
                  :username,
                  :salt,
                  :encrypted_password,
                  :password_hash,
                  :login_token

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    end
  end

=begin
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
=end

  def clear_password
    self.password = nil
  end

  def self.authenticate(user, password)
    return true if user.encrypted_password == BCrypt::Engine.hash_secret(password, user.salt)
    false
  end

  def create_token
     self.login_token ||= SecureRandom.uuid
  end

end
