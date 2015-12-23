class Task < ActiveRecord::Base
  include AASM
  aasm_column :state

  belongs_to :user

  has_attached_file :file

  validates :name, :description, presence: true
  validates_attachment :file,
    content_type: { content_type: ["application/pdf", "image/jpg", "image/jpeg", "image/gif", "image/png"] },
    size: { in: 0..2.megabytes }

  default_scope -> { order('created_at DESC') }

  aasm do
    state :new, initial: true
    state :started
    state :finished

    event :start do
      transitions from: :new, to: :started
    end

    event :finish do
      transitions from: :started, to: :finished
    end
  end
end
