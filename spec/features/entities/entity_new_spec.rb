require 'rails_helper'

RSpec.feature 'Entity new', type: :feature do
  before(:each) do
    @user = User.create(name: 'Gabriel', email: 'hello@example.com', password: 'password')
    @group = Group.create(name: 'Shopping', icon: 'https://i.imgur.com/Ar3Lf3Dt.png', user_id: @user.id)
    visit user_session_path
    fill_in 'email', with: 'hello@example.com'
    fill_in 'pass', with: 'password'
  end

  it 'display sign up button on page' do
    expect(page).to have_text 'Sign up'
  end
end