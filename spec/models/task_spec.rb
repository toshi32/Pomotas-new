require 'rails_helper'

describe 'タスクモデル機能', type: :model do
  let!(:user) { FactoryBot.create(:user)}
  let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  describe 'バリデーションのテスト' do
    context '全ての項目が記入されている' do
      it 'バリデーションが通る' do
        expect(task).to be_valid
      end
    end
    context 'タスクのタイトルが空の場合' do
      it 'バリデーションにひっかる' do
        task.title = nil
        expect(task).not_to be_valid
      end
    end
  end
end