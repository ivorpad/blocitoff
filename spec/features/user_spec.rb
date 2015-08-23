require 'rails_helper'

  describe User do

    describe "sign_up" do
      before do
        visit new_user_registration_path
      end

      it "can sign up and receives confirmation email" do
        fill_in 'Name', with: 'Ivor'
        fill_in 'Email', with: 'example@exampless.com'
        fill_in 'Password', with: '12345678'
        fill_in 'Password confirmation', with: '12345678'
        click_button 'Sign up'
        expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
      end

      it "has invalid email" do
        fill_in 'Name', with: 'Ivor'
        fill_in 'Email', with: 'ivorpad@123'
        fill_in 'Password', with: '12345678'
        fill_in 'Password confirmation', with: '12345678'
        click_button 'Sign up'
        expect(page).to have_content('Email is invalid')
      end

      it "has duplicated email" do
        fill_in 'Name', with: 'Ivor'
        fill_in 'Email', with: 'admin@example.com'
        fill_in 'Password', with: '12345678'
        fill_in 'Password confirmation', with: '12345678'
        click_button 'Sign up'
        expect(page).to have_content('Email has already been taken')
      end

    end

    describe "successful" do

      before do
        visit new_user_session_path
        @user = build(:user)
      end

      it "can sign in" do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password

        within 'form' do
          click_button 'Sign in'
        end
        expect(page).to have_content('Signed in successfully')
      end
    end

    describe "sign out" do

      before do
        visit new_user_session_path
        @user = build(:user)
      end

      it "sign out successfully" do
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'Sign in'
        click_on 'Sign out'
        expect(page).to have_content('Signed out successfully.')
      end
    end

    describe "reset" do
      before do
        visit new_user_password_path
        @user1 = build(:user)

      end
      it "sends instructions" do
        fill_in 'Email', with: @user1.email
        click_button 'Send me reset password instructions'
        expect(page).to have_content('You will receive an email with instructions on how to reset your password in a few minutes.')
      end
    end



  end
