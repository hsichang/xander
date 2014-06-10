# == Schema Information
#
# Table name: posts
#
#  id       :integer          not null, primary key
#  body     :text             not null
#  title_id :integer
#  order    :integer          default(100), not null
#  visible  :boolean          default(TRUE), not null
#  deleted  :boolean          default(FALSE), not null
#

class Post < ActiveRecord::Base
  attr_accessible :title_id,
                  :body,
                  :order,
                  :visible,
                  :deleted

  scope :deleted,     -> { where(:deleted => true) }
  scope :undeleted,   -> { where(:deleted => false) }

  scope :active,      -> { undeleted.where(:visible => true) }
  scope :inactive,    -> { undeleted.where(:visible => false) }

  scope :published,   -> { active.where(:visible => true) }
  scope :unpublished, -> { active.where(:visible => false) }

  belongs_to :title

end
