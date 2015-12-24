require 'rails_helper'

RSpec.describe TaskDecorator, type: :decorator do
  context 'file_link' do
    context 'exists file' do
      let(:task){ create(:task_with_file).decorate }

      it{ expect(task.file_link).to eq h.link_to 'Скачать', task.file.url(:original), target: '_blank' }
    end

    context 'nil file' do
      let(:task){ create(:task).decorate }

      it{ expect(task.file_link).to eq 'Не прикреплен' }
    end
  end

  context 'event_buttons' do
    context 'new task' do
      let(:task){ create(:task).decorate }

      it{ expect(task.event_buttons).to eq h.link_to('Начать', h.changed_state_account_task_path(task, event: :start), method: :patch, class: 'btn btn-success') + " " }
    end

    context 'started task' do
      let(:task){ create(:task, state: :started).decorate }

      it{ expect(task.event_buttons).to eq h.link_to('Завершить', h.changed_state_account_task_path(task, event: :finish), method: :patch, class: 'btn btn-warning') + " " }
    end

    context 'finished task' do
      let(:task){ create(:task, state: :finished).decorate }

      it{ expect(task.event_buttons).to eq h.link_to('Начать снова', h.changed_state_account_task_path(task, event: :rollback), method: :patch, class: 'btn btn-danger') + " " }
    end
  end
end
