# == Schema Information
#
# Table name: blog_entries
#
#  id             :integer          not null, primary key
#  billboard_text :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class BlogEntry < ActiveRecord::Base

  attr_accessible :billboard_text


end
