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

class Title < ActiveRecord::Base
  attr_accessible :name,
                  :order,
                  :visible,
                  :deleted

  scope :deleted,     -> { where(:deleted => true) }
  scope :undeleted,   -> { where(:deleted => false) }

  scope :active,      -> { undeleted.where(:visible => true) }
  scope :inactive,    -> { undeleted.where(:visible => false) }

  scope :published,   -> { active.where(:visible => true) }
  scope :unpublished, -> { active.where(:visible => false) }

  has_many :posts

  validates :name, presence: true
  validates :order, presence: true
  validates :order, numericality: true

  def published_posts
    self.posts.published
  end

end
