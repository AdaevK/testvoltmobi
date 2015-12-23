require 'rails_helper'

RSpec.describe 'devise/session/new.html.slim', type: :feature do
  let(:password) { 'qwerty12' }
  let(:user){ create(:user, password: password, password_confirmation: password) }

  it 'login/logout' do
    visit root_path

    click_link 'Вход в личный кабинет'

    expect(page).to have_content 'Вход в личный кабинет'

    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: password
    end

    click_button 'Войти'

    expect(page).to have_content 'Выйти'

    click_link 'Выйти'

    expect(page).to_not have_content 'Выйти'
  end

  it 'failer login' do
    visit root_path

    click_link 'Вход в личный кабинет'

    expect(page).to have_content 'Вход в личный кабинет'

    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '1231'
    end

    click_button 'Войти'

    expect(page).to have_content 'Неверный адрес эл. почты или пароль.'
  end
end
