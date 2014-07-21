# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  username      :string(255)      not null
#  password_hash :string(255)
#  email_address :string(255)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  uuid          :string(255)
#  superuser     :boolean          default(FALSE), not null
#  active        :boolean          default(FALSE), not null
#

require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  before_save :create_uuid

  attr_accessible :password,
                  :username,
                  :encrypted_password,
                  :password_hash,
                  :login_token,
                  :email_address,
                  :uuid,
                  :superuser,
                  :active
  attr_reader     :password
=begin
  validate :password_not_blank
=end
  validate :username_not_blank
  validate :username_is_not_reserved

  def password_not_blank
    return if self.password.nil?

    if self.password.blank?
      errors.add(:password, "Password can not be blank")
    end
  end

  def username_is_not_reserved
    return unless %w[ root superuser admin webmaster justworks customersupport sysop support ].include?(self.username)
    errors.add(:username, "is invalid")
  end

  def username_not_blank
    return if self.username.nil?

    if self.username.blank?
      errors.add(:username, "Usernname can not be blank")
    end
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def create_uuid
     self.uuid ||= SecureRandom.uuid
  end

  def active_superuser?
    self.active && self.superuser
  end

end
