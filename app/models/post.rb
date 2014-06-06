# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  billboard_text :text             not null
#

class Post < ActiveRecord::Base

  attr_accessible :billboard_text


end
