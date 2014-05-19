class Task < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { maximum: 100 }
  validates :user_id, presence: true

  default_scope { order('tasks.created_at ASC') }
end

