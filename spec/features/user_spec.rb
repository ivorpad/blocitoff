require 'rails_helper'

  describe User do

    describe "sign_up" do
      before do
        visit new_user_registration_path
      end

      it "can sign up and receives confirmation email" do
        fill_in 'Name', with: 'Ivor'
        fill_in 'Email', with: 'ivorpad@me.com'
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
        create(:user, email: 'taken@gmail.com')
        fill_in 'Name', with: 'Ivor'
        fill_in 'Email', with: 'taken@gmail.com'
        fill_in 'Password', with: '12345678'
        fill_in 'Password confirmation', with: '12345678'
        click_button 'Sign up'
        expect(page).to have_content('Email is taken')
      end

    end

  end
