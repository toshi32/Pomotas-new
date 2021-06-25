require 'rails_helper'

RSpec.describe 'ラベル登録機能', type: :system do
  let(:user) { FactoryBot.create(:user) }
  let!(:task) { FactoryBot.create(:task, user_id: user.id) }
  let!(:comment) {FactoryBot.create(:comment, task_id: task.id)}
  describe "コメント機能について" do
    before do
    visit new_user_session_path
    fill_in "user[email]", with: "user1@example.com"
    fill_in "user[password]", with: "password1"
    click_on 'ログイン'
    visit tasks_path
    visit task_path(task.id)
    end
    context "コメント新規投稿について", js: true do
      it "コメントを投稿する" do
        fill_in "comment[content]", with: "test_comment"
        click_on "登録する"
        expect(page).to have_content "test_comment"
      end
    end
    context "コメント編集について", js: true do
      it "コメントを編集する" do
        fill_in "comment[content]", with: "test_comment"
        click_on "登録する"
        # contact = Contact.find_by(test_comment:)
        # first('ul ui div p').click_link '編集'
        # find('.edit').click
        # binding.irb
        click_link "編集", href: edit_task_comment_path(task, comment)
        # click_link "編集", href: "/tasks/" + (task.id).to_s + "/comments/" + (comment.id).to_s + "/edit"
        # href="/tasks/16/comments/11/edit"
        fill_in "comment[content]", with: "test"
        click_on "更新する"
        expect(page).to have_content "test"
      end
    end
    context "コメント削除について", js: true do
      it "コメントを削除する" do
        # contact = Contact.find_by(test_comment:)
        # first('ul ui div p').click_link '編集'
        # find('.edit').click
        # binding.irb
        click_link "削除", href: task_comment_path(comment.task_id, comment.id)
        #click_link "削除", href: "/tasks/" + (task.id).to_s + "/comments/" + (comment.id).to_s
        page.driver.browser.switch_to.alert.accept
        # href="/tasks/16/comments/11/edit"
        expect(page).to have_content "コメントが削除されました"
      end
    end
  end
end
