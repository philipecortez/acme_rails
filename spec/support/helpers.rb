module Helpers
  # def sign_in(user)
  #   visit new_user_session_path
  #   binding.pry
  #   within(".form-inputs") do
  #     fill_in 'Email', with: 'John@doe.com' 
  #     fill_in 'Password', with: 'password'
  #   end

  #   click_button 'Log in'
  #   print page.html
  #   expect(page).to have_content 'Signed in successfully.'
  # end

  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      active = page.evaluate_script('jQuery.active')
      until active == 0
        active = page.evaluate_script('jQuery.active')
      end
    end
    
  end
end