require 'rails_helper'


RSpec.describe 'User関連機能',type: :system do
  let!(:user){ FactoryBot.create(:user) }
  before do
    visit root_path
  end
  describe 'User登録とログインとログアウト関係' do
    context 'SignUp 全て正しく記述された場合' do
      it 'SignUpできる' do
        click_on 'Sign Up'
        fill_in "user[name]", with: "user3"
        fill_in "user[email]", with: "user3@example.com"
        fill_in "user[password]", with: "password3"
        fill_in "user[password_confirmation]", with: "password3"
        sleep(0.5)
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
        expect(page).to have_content 'タスク一覧'
      end
    end
    context 'SignUp 入力漏れがあった場合' do
      it 'SignUpできない' do
        click_on 'Sign Up'
        click_button 'アカウント登録'
        expect(page).to have_content 'Eメールを入力してください'
        expect(page).to have_content 'パスワードを入力してください'
        expect(page).to have_content 'ユーザーネームを入力してください'
      end
    end
    context 'LogIn 全て正しく記述された場合' do
      it 'LogInできる' do
        click_on 'Log In'
        fill_in "user[email]", with: "user1@example.com"
        fill_in "user[password]", with: "password1"
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_content 'タスク一覧'
      end
    end
    context 'LogIn 入力漏れがあった場合' do
      it 'LogInできない' do
        click_on 'Log In'
        fill_in "user[email]", with: ""
        fill_in "user[password]", with: "password1"
        click_button 'ログイン'
        expect(page).to have_content 'Eメールまたはパスワードが違います。'
      end
    end
    context 'ログアウトした場合' do
      it  'トップページに戻りログアウト状態になる' do
        click_on 'Log In'
        fill_in "user[email]", with: "user1@example.com"
        fill_in "user[password]", with: "password1"
        click_button 'ログイン'
        expect(page).to have_content 'ログインしました。'
        expect(page).to have_content 'タスク一覧'
        click_on 'Log Out'
        expect(page)
      end
    end
  end
end