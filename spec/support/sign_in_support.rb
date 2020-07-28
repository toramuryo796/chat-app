module SignInSupport
  def sign_in(user)
    #トップページに遷移
    visit root_path
    #すでに保存されているユーザーのemailとpasssword を入力する
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    #ログインボタンをクリックする
    click_on("Log in")
    #ルートページに遷移することを期待する
    expect(current_path).to eq root_path
  end
end