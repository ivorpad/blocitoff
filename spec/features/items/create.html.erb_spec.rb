require 'rails_helper'

describe ItemsController
describe 'users#create' do
  before do
    @user = build(:user)
    visit new_user_session_path
  end

  it 'can create multiple items' do
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Sign in'

    fill_in 'Todo', with: 'New todo item #1'
    click_button 'Create item'

    fill_in 'Todo', with: 'New todo item #2'
    click_button 'Create item'

    expect(page).to have_content('New todo item #1')
    expect(page).to have_content('New todo item #2')
    # page.has_css?('input#item_name.form-control')
  end
end
