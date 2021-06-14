require 'rails_helper'

RSpec.describe 'Post' do
  it 'posts have comments' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    post = user1.posts.create(body: 'test test test')
    post.coments.create(body: 'this is a comment', user_id: user1.id)
    visit '/login'
    fill_in 'username', with: 'deadmau5'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit "/posts/#{post.id}"
    expect(page).to have_content 'this is a comment'\
  end

  it 'discover page show posts from other users' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    User.create(name: 'Dr. Meowingtons PhD', username: 'cat', password: 'password')
    user1.posts.create(body: 'test test test')
    visit '/login'
    fill_in 'username', with: 'cat'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit '/ousers'
    expect(page).to have_content 'test test test'
  end

  it 'home page show posts from users you are following' do
    user1 = User.create(name: 'big mouse head', username: 'deadmau5', password: 'password')
    user2 = User.create(name: 'Dr. Meowingtons PhD', username: 'cat', password: 'password')
    user1.posts.create(body: 'test test test')
    user2.followers.create(follow_id: user1.id)
    visit '/login'
    fill_in 'username', with: 'cat'
    fill_in 'password', with: 'password'
    click_button 'Log In'
    visit '/'
    expect(page).to have_content 'test test test'
  end
end
