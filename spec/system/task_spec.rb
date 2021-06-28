require 'rails_helper'

RSpec.describe 'Task関連機能',type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  let!(:task2) { FactoryBot.create(:task2, user_id: user.id) }
  let!(:task3) { FactoryBot.create(:task3, user_id: user.id) }
  before do
    visit new_user_session_path
    fill_in "user[email]", with: "user1@example.com"
    fill_in "user[password]", with: "password1"
    click_on 'ログイン'
    sleep(0.5)
    # visit tasks_path
  end
  describe 'Task 新規作成' do
    context 'タスクを新規作成した場合' do
      it '作成したタスクが表示される' do
        visit new_task_path
        fill_in "task[title]", with: "task_name"
        fill_in "task[content]", with: "task_content"
        click_on '登録する'
        expect(page).to have_content 'task_name'
      end
    end
  end
  describe 'Task 一覧表示' do
    context '一覧画面に移った場合' do
      it '作成済みのタスク一覧が表示される' do
        expect(page).to have_content 'task'
      end
    end
    context 'タスクが作成日時の新しい順に並んでいる場合' do
      it '新しいタスクが一番上に表示される' do
        task_list = all('.task_list')
        expect(task_list[0]).to have_content 'task3'
      end
    end
  end
  describe 'Task 編集' do
    context '作成したタスクを編集する場合' do
      it '投稿したタスクを編集する' do
        first(:link, '編集').click
        fill_in "task[title]", with: "task_name"
        click_on '更新する'
        task_list = all('.task_list')
        expect(task_list[0]).to have_content 'task_name'
      end
    end
  end
  describe 'Task 削除' do
    context '作成したタスクを削除する場合' do
      it '投稿したタスクを削除する' do
        first(:link, '削除').click
        task_list = all('.task_row')
        expect(task_list[0]).to have_content 'task2'
      end
    end
  end
  describe 'Task 詳細表示' do
    context '選択したタスクの詳細画面に移る場合' do
      it '該当タスクの内容が表示される' do
        visit task_path(task.id)
        expect(page).to have_content 'task'
      end
    end
  end
  describe 'Task ポモドーロページ表示' do
    context '選択したタスクのポモドーロページに移る場合' do
      it '該当タスクのポモドーロタイマーが表示される' do
        first(:link, 'ポモドーロ').click
        expect(page).to have_content 'Pomodoro Timer'
      end
    end
  end
  describe '検索機能' do
    context '終了期限で検索した場合' do
      it '該当タスクが表示される' do
        fill_in "q[time_limit_gteq]" ,with: '2021,8,1'
        fill_in "q[time_limit_lteq]" ,with: '2021,8,8'
        click_on '検索'
        expect(page).to have_content 'task2'
      end
    end
    context 'ステータスで検索した場合' do
      it '該当タスクが表示される' do
        select "やったよ", from: :q_status_eq
        click_on '検索'
        expect(page).to have_content 'task'
      end
    end
    context '終了日とステータスで検索した場合' do
      it '該当タスクが表示される' do
        fill_in "q[time_limit_gteq]" ,with: '2021,8,1'
        fill_in "q[time_limit_lteq]" ,with: '2021,8,8'
        select "やってないよ", from: :q_status_eq
        click_on '検索'
        expect(page).to have_content 'task2'
      end
    end
  end
end