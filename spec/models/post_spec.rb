require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'posts can be created without pictures' do
    user = User.create(name: 'first user', username: 'postuser', password: 'password')
    post = user.posts.new(body: 'fffirst post')
    expect(post.save).to eq(true)
  end

  it 'users have many posts' do
    user = User.create(name: 'first user', username: 'postuser', password: 'password')
    user.posts.create(body: 'fffirst post')
    user.posts.create(body: 'ffirst post')
    user.posts.create(body: 'first post')
    expect(user.posts.count).to eq(3)
  end
end
