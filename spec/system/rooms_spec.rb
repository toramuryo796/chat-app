require 'rails_helper'

RSpec.describe "チャットルームの削除機能", type: :system do
  before do
    @room_user = FactoryBot.create(:room_user)
  end

  it 'チャットルームを削除すると、関連するメッセージがすべて削除されていること'do
    #サインインする
    sign_in(@room_user.user)
    #作成されたチャットルームに遷移する
    click_on(@room_user.room.name)
    #メッセージ情報を5つのDBに追加する
    FactoryBot.create_list(:message, 5, room_id: @room_user.room.id, user_id: @room_user.user.id)
    #「チャット終了するボタンをクリックすることで、作成した５つのメッセージが削除されていることを期待する
    expect{
      find_link("チャットを終了する", href: room_path(@room_user.room)).click
    }.to change { @room_user.room.messages.count }.by(-5)

    #ルートページに遷移されることを期待する
    expect(current_path).to eq root_path
  end
end
