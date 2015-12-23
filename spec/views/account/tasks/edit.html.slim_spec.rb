require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe '/account/tasks/edit.html.slim', type: :feature do
  let(:user){ create(:user) }
  let(:task){ create(:task, user: user) }
  let(:new_name){ 'New name task' }
  before{ create(:user) }

  it 'add new task' do
    login_as(user, scope: :user)

    visit edit_account_task_path(task)

    within("#edit_task_#{task.id}") do
      fill_in 'task_name', with: new_name
    end

    click_button 'Изменить'

    expect(page).to have_content new_name
    expect(page).to have_content task.description
  end
end
