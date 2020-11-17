require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context 'when name field is blank' do
      before do
        @user = User.create(name: nil, email: "my_email@com", password: "pass")
      end
      it 'does not save and throws error' do
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end    
    end

    context 'when email field is blank' do
      before do
        @user = User.create(name: "my name", email: nil, password: "pass")
      end
      it 'does not save and throws error' do
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end    
    end
    
    context 'when password field is blank' do
      before do
        @user = User.create(name: "my name", email: "my_email@com", password: nil)
      end
      it 'does not save and throws error' do
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end    
    end

    context 'when password is too short' do
      before do
        @user = User.create(name: "my name", email: "my_email@com", password: "p")
      end
      it 'does not save and throws error' do
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
      end    
    end
  end
end
