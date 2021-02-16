require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザーの新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全項目が入力されていれば登録できる' do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと登録できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと登録できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれないと登録できない' do
      @user.email = 'testemail'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空だと登録できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password:半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'password:半角英語のみでは登録できない' do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'abc123'
      @user.password_confirmation = '789xyz'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'genderがなければ登録できない' do
      @user.gender = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Gender can't be blank")
    end

    it 'genderがなければ登録できない' do
      @user.age = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Age can't be blank")
    end
  end
end
