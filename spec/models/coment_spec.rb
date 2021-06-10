require 'rails_helper'

RSpec.describe Coment, type: :model do
  it 'users have many coments in diferent posts' do
    user = User.create(name: 'first user', username: 'commentuser', password: 'password')
    user2 = User.create(name: 'first user', username: 'commentuser2', password: 'password')
    post1 = user2.posts.create(body: 'first post')
    post2 = user2.posts.create(body: 'second post')
    post3 = user2.posts.create(body: 'third post')
    post1.coments.create(body:'x1', user_id:user.id)
    post2.coments.create(body:'x2', user_id:user.id)
    post3.coments.create(body:'x3', user_id:user.id)    
  
    expect(user.coments.count).to eq(3)
  end

  it 'a posts have many coments' do
    user = User.create(name: 'first user', username: 'commentuser', password: 'password')
    user2 = User.create(name: 'first user', username: 'commentuser2', password: 'password')
    user3 = User.create(name: 'first user', username: 'commentuser3', password: 'password')
    post1 = user.posts.create(body: 'first post')
    post1.coments.create(body:'x1', user_id:user2.id)
    post1.coments.create(body:'x2', user_id:user.id)
    post1.coments.create(body:'x3', user_id:user3.id)
    post1.coments.create(body:'x4', user_id:user2.id)
    
  
    expect(post1.coments.count).to eq(4)
  end

  
end
