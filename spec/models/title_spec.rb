# == Schema Information
#
# Table name: titles
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order      :integer          default(100), not null
#  visible    :boolean          default(TRUE), not null
#  deleted    :boolean          default(FALSE), not null
#

require 'rails_helper'

RSpec.describe Title, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
