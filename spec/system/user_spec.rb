require 'rails_helper'
describe 'ユーザー機能', type: :system do
  describe 'ユーザーの新規登録テスト' do
    before do
      visit new_user_registration_path
    end
    context '名前、メールアドレス、パスワードが正しい場合,' do
      it '新規登録ができる' do
        fill_in 'user[name]', with: '名無しの権兵衛'
        fill_in 'user[email]', with: 'nanashinogonbei@example.com'
        fill_in 'user[password]', with: 'nanashinogonbei'
        fill_in 'user[password_confirmation]', with: 'nanashinogonbei'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録が完了しました。'
        expect(User.count).to eq(1)
      end
    end
    context '名前が未記入の場合' do
      it 'バリデーションエラーになる' do
        fill_in 'user[name]', with: ''
        fill_in 'user[email]', with: 'nanashinogonbei@example.com'
        fill_in 'user[password]', with: 'nanashinogonbei'
        fill_in 'user[password_confirmation]', with: 'nanashinogonbei'
        click_button 'アカウント登録'
        expect(page).to have_content 'アカウント登録'
        expect(page).to have_content 'エラーが発生したため ユーザー は保存されませんでした。'
        expect(page).to have_content 'ユーザーネームを入力してください'
      end
    end
  end
end