require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  context 'class_for_state' do
    context 'new task' do
      let(:task){ build(:task) }

      it{ expect(helper.class_for_state(task.state)).to eq('alert-info') }
    end

    context 'started task' do
      let(:task){ build(:task, state: :started) }

      it{ expect(helper.class_for_state(task.state)).to eq('alert-success') }
    end

    context 'finished task' do
      let(:task){ build(:task, state: :finished) }

      it{ expect(helper.class_for_state(task.state)).to eq('alert-danger') }
    end
  end
end
