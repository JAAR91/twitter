require 'rails_helper'

RSpec.describe 'Users' do
  it 'user can log in' do
    User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    visit '/login'
    fill_in 'username', with: 'deadmau5'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    expect(page).to have_content 'big mouse head'
  end

  it 'user see its post on its profile' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    user1.posts.create(body: 'test test test')
    visit '/login'
    fill_in 'username', with: 'deadmau5'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit "/users/#{user1.id}"
    expect(page).to have_content 'test test test'
  end

  it 'user see post from users he/she follows' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    user1.posts.create(body: 'test test test')
    user2 = User.create(name: 'Dr. Meowington PhD', username: 'meowingtons', password: 'password')
    user2.followers.create(follow_id: user1.id)
    visit '/login'
    fill_in 'username', with: 'meowingtons'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit '/'
    expect(page).to have_content 'test test test'
  end

  it 'user cant comment other users posts' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    post1 = user1.posts.create(body: 'test test test')
    user2 = User.create(name: 'Dr. Meowington PhD', username: 'meowingtons', password: 'password')
    post1.coments.create(body: 'this is a comment', user_id: user2.id)
    visit '/login'
    fill_in 'username', with: 'meowingtons'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit "/posts/#{post1.id}"
    expect(page).to have_content 'this is a comment'
  end

  it 'user main show how many user are following him/her' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    user2 = User.create(name: 'Dr. Meowington PhD', username: 'meowingtons', password: 'password')
    user2.followers.create(follow_id: user1.id)
    visit '/login'
    fill_in 'username', with: 'meowingtons'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    expect(page).to have_content '1'
  end

  it 'cant acces any page if user is not logged in' do
    visit '/users'
    expect(page).to have_content 'Log In'
  end

  it 'user cant edit other profiles' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    User.create(name: 'Dr. Meowington PhD', username: 'meowingtons', password: 'password')
    visit '/login'
    fill_in 'username', with: 'meowingtons'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit "/users/#{user1.id}"
    expect(page).to_not have_content 'Edit Profile'
  end

  it 'user can only modify its own' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    visit '/login'
    fill_in 'username', with: 'deadmau5'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit "/users/#{user1.id}"
    expect(page).to have_content 'Edit Profile'
  end

  it 'connect show all users' do
    User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    User.create(name: 'Dr. Meowington PhD', username: 'meowingtons', password: 'password')
    User.create(name: 'Saul Hudson', username: 'Slash', password: 'password')
    User.create(name: 'Ozzy Osborne', username: 'ozzy', password: 'password')
    visit '/login'
    fill_in 'username', with: 'deadmau5'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit '/users'
    User.all.each do |user|
      expect(page).to have_content user.name
    end
  end
end
