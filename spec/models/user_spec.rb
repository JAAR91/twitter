require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Users' do
    it 'users cant be created without images and avatars' do
      User.create(name: 'first user', username: 'first', password: 'password')
      User.create(name: 'secod user', username: 'second', password: 'password')
      expect(User.all.count).to eq(2)
    end

    it 'username cant be repetead' do
      User.create(name: 'firstusertest user', username: 'firstusertest', password: 'password')
      User.create(name: 'second user', username: 'firstusertest', password: 'password')
      expect(User.all.count).not_to eq(2)
    end
  end
end
