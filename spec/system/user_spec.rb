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
  describe '管理者権限機能テスト' do
    let!(:user) { FactoryBot.create(:user)}
    let!(:user2) { FactoryBot.create(:user2)}
    before do
      click_on 'ゲストログイン（管理者閲覧用）'
      click_on('管理画面')
    end
    context '管理者画面で編集ボタンを押した時' do
      it '該当ユーザーを編集できる' do
      first('.nav-pills').find_link('ユーザー').click
      find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(1) td:nth-child(9)').find(".list-inline").find_link('編集').click
      find_by_id("user_email").set "hensyuu@docomo.ne.jp"
      click_button '保存'
      expect(page).to have_content 'ユーザーの更新に成功しました'
      end
    end
    context '管理者画面で削除ボタンを押した時' do
      it '該当ユーザーを削除できる' do
      first('.nav-pills').find_link('ユーザー').click
      find_by_id('list').find_by_id("bulk_form").find(".table-condensed").first('tr:nth-child(2) td:nth-child(9)').find(".list-inline").find_link('削除').click
      click_button '実行する'
      expect(page).to have_content 'ユーザーの削除に成功しました'
      end
    end
  end
end