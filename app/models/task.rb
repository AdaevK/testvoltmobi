class Task < ActiveRecord::Base
  include AASM
  aasm_column :state

  belongs_to :user

  validates :name, :description, presence: true

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
