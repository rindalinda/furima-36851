require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、password・password_confirmation,lastname(1,2)とfirtsname(1,2),birthdayが存在すればできる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録ができない場合' do
      it 'nicknameが必須' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが必須' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'password必須' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが５文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '12345a'
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'last_name1が必須' do
        @user.last_name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name1 can't be blank", 'Last name1 Input full-width characters')
      end

      it 'first_name1が必須' do
        @user.first_name1 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name1 can't be blank", 'First name1 Input full-width characters')
      end

      it 'last_name2が必須' do
        @user.last_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name2 can't be blank",
                                                      'Last name2 Input full-width katakana characters')
      end

      it 'first_name2が必須' do
        @user.first_name2 = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name2 can't be blank",
                                                      'First name2 Input full-width katakana characters')
      end

      it 'last_name1が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.last_name1 = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name1 Input full-width characters')
      end

      it 'first_name1が全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name1 = 'kana'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name1 Input full-width characters')
      end

      it 'last_name2が全角（カタカナ）でなければ登録できない' do
        @user.last_name2 = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name2 Input full-width katakana characters')
      end

      it 'first_name2が全角（カタカナ）でなければ登録できない' do
        @user.last_name2 = 'かな'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name2 Input full-width katakana characters')
      end

      it 'birthdayが必須' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
