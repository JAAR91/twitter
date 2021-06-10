require 'rails_helper'

RSpec.describe Follower, type: :model do
  describe 'Follower' do
    it 'users have many followers' do
      user1 = User.create(name: 'first user', username: 'followtest1', password: 'password')
      user2 = User.create(name: 'second user', username: 'followtest2', password: 'password')
      user1.followers.create(follow_id: user2.id)
      expect(user2.inverted_followers.count).to eq(1)
    end

    it 'users can follow manby people' do
      user1 = User.create(name: 'first user', username: 'followtest1', password: 'password')
      user2 = User.create(name: 'second user', username: 'followtest2', password: 'password')
      user3 = User.create(name: 'second user', username: 'followtest3', password: 'password')
      user1.followers.create(follow_id: user2.id)
      user1.followers.create(follow_id: user3.id)
      expect(user1.followers.count).to eq(2)
    end
  end
end
