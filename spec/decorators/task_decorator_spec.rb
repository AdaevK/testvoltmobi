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
end
