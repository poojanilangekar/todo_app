class Todolist < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true, length: { maximum: 50 }
  validates :user_id, presence: true
  has_many :tasks
  default_scope { order('todolists.created_at ASC') }

end
