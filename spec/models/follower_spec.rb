require 'rails_helper'

RSpec.describe Follower, type: :model do
  describe 'Follower' do
    it 'users have inverted followers' do
      user1 = User.create(name: 'first user', username: 'followtest1', password: 'password')
      user2 = User.create(name: 'second user', username: 'followtest2', password: 'password')
      user1.followers.create(follow_id: user2.id)
      expect(user2.inverted_followers.count).to eq(1)
    end
  end
end
