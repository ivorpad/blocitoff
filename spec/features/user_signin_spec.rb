require 'rails_helper'

describe User do
  describe 'user sign in' do
    before do
      visit new_user_session_path
      @user = build(:user)
    end

    it 'redirects to users#show after sign in' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      expect(page).to have_content('Welcome to your user profile')
    end

    it 'have the correct user information' do
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Sign in'
      expect(page).to have_content(@user.email)
    end
  end
end
