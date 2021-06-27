require 'rails_helper'

describe 'タスクモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:user)}
  # let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task = Task.new(title: '', content: '失敗テスト')
        expect(task).not_to be_valid
      end
    end
  end
  describe 'バリデーションのテスト' do
    context 'タスクの詳細が空の場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: '')
        expect(task).not_to be_valid
      end
    end
  end
  describe 'バリデーションのテスト' do
    context '過去の日付をタスクに登録した場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: '失敗テスト', time_limit: "002021-05-05")
        expect(task).not_to be_valid
      end
    end
  end
  describe 'バリデーションのテスト' do
    context 'タスク名に50文字以上登録した場合' do
      it 'バリデーションにひっかかる' do
        task = Task.new(title: '失敗テスト', content: '失敗テスト'*11, time_limit: "002021-05-05")
        expect(task).not_to be_valid
      end
    end
  end
  describe 'バリデーションのテスト' do
    context 'タスクのタイトルと詳細に内容が記載されている場合' do
      it 'バリデーションが通る' do
        task = Task.new(title: '成功テスト', content: '成功テスト', time_limit: "002021-12-24", user: user)
        sleep(0.5)
        expect(task).to be_valid
      end
    end
  end
end