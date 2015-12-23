require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe '/account/tasks/new.html.slim', type: :feature do
  let(:user){ create(:user) }
  let(:task){ attributes_for(:task) }
  before{ create(:user) }

  it 'add new task' do
    login_as(user, scope: :user)

    visit new_account_task_path

    within('#new_task') do
      fill_in 'task_name', with: task[:name]
      fill_in 'task_description', with: task[:description]
    end

    click_button 'Добавить'

    expect(page).to have_content task[:name]
    expect(page).to have_content task[:description]
  end
end
