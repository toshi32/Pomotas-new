require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  describe "バリデーションのテスト" do
    context "コメントが1文字以上の場合", js: true do
      it "バリデーションが通る" do
        comment = Comment.new(content: '成功テスト', task: task )
        expect(comment).to be_valid
      end
    end
    context 'コメントを空欄で登録しようとした場合', js: true do
      it 'バリデーションにひっかかる' do
        comment = Comment.new(content: '', task: task )
        expect(comment).not_to be_valid
      end
    end
  end
end
