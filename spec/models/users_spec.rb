require 'rails_helper'

RSpec.describe User, type: :model do
    describe 'Users' do
        it 'users cant be created without images and avatars' do
            User.create(name: 'first user', username: 'first', password: 'password')
            User.create(name: 'first user', username: 'second', password: 'password')
            expect(User.all.size).to eq(2)
        end
        it 'user creation test' do
          User.create(name: 'first user', username: 'first', password: 'password')
          expect(User.all.size).to eq(2)
        end
    
        it 'username cant be repetead' do
          User.create(name: 'first user', username: 'first', password: 'password')
          User.create(name: 'second user', username: 'first', password: 'password')
    
          expect(User.all.size).to eq(2)
        end
    end
end
