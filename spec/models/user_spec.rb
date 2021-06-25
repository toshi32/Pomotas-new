require 'rails_helper'
require "cancan/matchers"

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  describe 'ユーザー新規作成時のバリデーションテスト' do
    context '名前、メールアドレス、パスワードが正しい場合' do
      it 'ユーザーを作成できる' do
        expect(user).to be_valid
      end
    end
    context '名前が未入力の場合' do
      it 'バリデーションエラーになる' do
        user.name = nil
        expect(user).to be_invalid
      end
    end
    context 'メールアドレスが未入力の場合' do
      it 'バリデーションエラーになる' do
        user.email = ""
        expect(user).to be_invalid
      end
    end
    context 'メールアドレスが無効な形式の場合' do
      it 'バリデーションエラーになる' do
        user.email = "foobar"
        expect(user).to be_invalid
      end
    end
    context 'メールアドレスが重複した場合,' do
      it 'バリデーションエラーになる' do
        User.create!(
          name: 'user1',
          email: 'user1@example.com',
          password: 'password1',
          password_confirmation: 'password1',
        )
        user = User.new(
          name: 'user1',
          email: 'user1@example.com',
          password: 'password1',
          password_confirmation: 'password1',
        )
        user.invalid?
        expect(user.errors[:email]).to include("はすでに存在します")
      end
    end
    context 'パスワードが未入力の場合' do
      it 'バリデーションエラーになる' do
        user.password = ""
        expect(user).to be_invalid
      end
    end
    context 'パスワードが6文字以下の場合' do
      it 'バリデーションエラーになる' do
        user.password = "hoge"
        expect(user).to be_invalid
      end
    end
    context 'パスワード51文字以上の場合' do
      it 'バリデーションエラーになる' do
        user.password = "hoge"*13
        expect(user).to be_invalid
      end
    end
  end
  describe '管理者権限機能' do
    context '管理者権限がある場合' do
      it 'ユーザ-の作成・編集・削除ができる' do
        @manager = FactoryBot.create(:user)
        @ability = Ability.new(@manager)
        test_user = User.new(name: "test", email: "test@test.com", password: "password")
        expect(@ability).to be_able_to(:create, test_user)
        test_user = User.new(name: "test", email: "test@test.com", password: "password")
        expect(@ability).to be_able_to(:edit, test_user)
        test_user = User.new(name: "test", email: "test@test.com", password: "password")
        expect(@ability).to be_able_to(:destroy, test_user)
      end
    end
    context '管理者権限がない場合' do
      it 'ユーザーを作成・編集・削除ができない' do
        @manager = FactoryBot.create(:user2)
        @ability = Ability.new(@manager)
        test_user = User.new(name: "test", email: "test@test.com", password: "password")
        expect(@ability).to_not be_able_to(:create, test_user)
        test_user = User.new(name: "test", email: "test@test.com", password: "password")
        expect(@ability).to_not be_able_to(:edit, test_user)
        test_user = User.new(name: "test", email: "test@test.com", password: "password")
        expect(@ability).to_not be_able_to(:destroy, test_user)
      end
    end
  end
end
