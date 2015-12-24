require 'rails_helper'

RSpec.describe Task, type: :model do
  it{ is_expected.to have_db_column(:name).of_type(:string) }
  it{ is_expected.to have_db_column(:description).of_type(:text) }
  it{ is_expected.to have_db_column(:state).of_type(:string) }
  it{ is_expected.to have_db_column(:user_id).of_type(:integer) }
  it{ is_expected.to have_attached_file(:file) }

  it{ is_expected.to have_db_index(:user_id) }

  it{ is_expected.to belong_to(:user) }

  it{ is_expected.to validate_presence_of(:name) }
  it{ is_expected.to validate_presence_of(:description) }
  it{ is_expected.to validate_attachment_content_type(:file).allowing("application/pdf", "image/jpg", "image/jpeg", "image/gif", "image/png") }
  it{ is_expected.to validate_attachment_size(:file).in(0..2.megabytes) }

  context 'default scope' do
    it{ expect(Task.default_scoped.order_values).to eq ['created_at DESC'] }
  end

  context 'aasm state' do
    context 'init (new)' do
      subject{ build(:task) }

      it{ is_expected.to be_new }
      its(:start){ is_expected.to be_truthy }

      it_behaves_like 'aasm_event_raise', [:finish, :rollback]

      context 'new to started' do
        before{ subject.start }
        it{ is_expected.to be_started }
      end
    end

    context 'started' do
      subject{ build(:task, state: :started) }

      it{ is_expected.to be_started }
      its(:finish){ is_expected.to be_truthy }

      it_behaves_like 'aasm_event_raise', [:start, :rollback]

      context 'started to finished' do
        before{ subject.finish }
        it{ is_expected.to be_finished }
      end
    end

    context 'finished' do
      subject{ build(:task, state: :finished) }

      it{ is_expected.to be_finished }
      its(:rollback){ is_expected.to be_truthy  }

      it_behaves_like 'aasm_event_raise', [:start]

      context 'finished to started' do
        before{ subject.rollback }
        it{ is_expected.to be_started }
      end
    end
  end
end
