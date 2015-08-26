class Item < ActiveRecord::Base
  belongs_to :user
  default_scope { order('updated_at DESC') }

  validates :name, length: { minimum: 5 }
end
