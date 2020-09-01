module Helpers
  module Session
    def sign_in(user)
      visit new_session_path

      fill_in :username, with: user.username
      click_button 'Log In'
    end

    def sign_out
      session[:user_id] = nil
      visit root_path
    end
  end
end