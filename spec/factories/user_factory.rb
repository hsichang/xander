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

FactoryGirl.define do
  factory :user do
    username 'xanderduell'
    password 'password'
    email_address 'good@email.com'
  end
end
