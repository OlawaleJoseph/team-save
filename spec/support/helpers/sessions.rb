module Helpers
  module Session
    def sign_in(user)
      visit new_session_path

      fill_in 'user[username]', with: user.username
      click_button 'Log In'
    end

    def sign_out
      click_link 'Logout'
    end
  end
end
