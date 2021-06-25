require 'rails_helper'
RSpec.describe 'ラベル登録機能', type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task2, user_id: user.id) }
  let!(:task2) { FactoryBot.create(:task2, user_id: user.id) }
  before do
    visit new_user_session_path
    fill_in "user[email]", with: "user1@example.com"
    fill_in "user[password]", with: "password1"
    click_on 'ログイン'
    visit tasks_path
  end
  describe 'ラベル登録のテスト' do
    context 'タスク作成時にラベルを選択した場合' do
      it 'タスクにラベルが紐づいて表示される' do
        FactoryBot.create(:label)
        visit new_task_path
        fill_in 'task[title]', with: "Test_Task"
        fill_in "task[content]", with: "Test_Content"
        check "午前"
        click_on '登録する'
        expect(page).to have_content 'Test_Task'
        expect(page).to have_content "#午前"
      end
    end
    context 'タスク編集時にラベルを別のものにした場合' do
      it '変更したタスクにラベルが紐づいて表示される' do
        FactoryBot.create(:label2)
        FactoryBot.create(:label3)
        visit edit_task_path(task2.id)
        check '勉強'
        click_on '更新する'
        visit edit_task_path(task2.id)
        uncheck '勉強'
        check '午後'
        expect(page).to have_content 'task2'
        expect(page).to have_content '午後'
      end
    end
  end
  describe 'ラベル検索のテスト' do
    context 'ラベル名で検索した場合' do
      it '選択したラベルのついたタスクが表示される' do
        FactoryBot.create(:label)
        FactoryBot.create(:label2)
        visit edit_task_path(task.id)
        check '午前'
        click_on '更新する'
        visit edit_task_path(task2.id)
        check '午後'
        click_on '更新する'
        visit tasks_path
        sleep(0.1)
        label = Label.find_by(name: '午前')
        find("#q_labels_id_eq_any_#{label.id}", visible: false).click
        click_on '検索'
        expect(page).to have_content 'task'
        expect(page).to have_content '午前'
      end
    end
  end
end