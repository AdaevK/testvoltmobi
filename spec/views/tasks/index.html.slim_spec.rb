require 'rails_helper'

RSpec.describe 'tasks/index.html.slim', type: :feature do
  let(:user){ create(:user) }
  let(:task){ create(:task, user: user) }
  before{ task }

  it 'visit root page' do
    visit root_path

    expect(page).to have_content task.name
    expect(page).to have_content task.description
    expect(page).to have_content task.user.email
  end
end
