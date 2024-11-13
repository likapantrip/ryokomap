require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # メニューアイコンをクリックすると、新規登録ページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('新規登録')
      # 新規登録リンクをクリックすると、新規登録ページへ遷移することを確認する
      click_link '新規登録'
      expect(page).to have_content('新規登録')
      # ユーザー情報を入力する
      fill_in 'ユーザー名', with: @user.user_name
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      fill_in 'パスワードの再入力', with: @user.password_confirmation
      # 新規登録ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { User.count }.by(1)
      # トップページへ遷移していることを確認する
      expect(page).to have_current_path(root_path)

      # 現状、画面遷移した場合にメニューアイコンのクリックからメニューを表示できないため
      # トップページに移動する
      visit root_path
      # メニューアイコンをクリックすると、ログアウトページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('ログアウト')
      # ログインページへ遷移するリンクや新規登録ページへ遷移するリンクが表示されていないことを確認する
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end
  context 'ユーザー新規登録ができないとき' do 
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # メニューアイコンをクリックすると、新規登録ページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('新規登録')
      # 新規登録リンクをクリックすると、新規登録ページへ遷移することを確認する
      click_link '新規登録'
      expect(page).to have_content('新規登録')
      # ユーザー情報を入力する
      fill_in 'ユーザー名', with: ''
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      fill_in 'パスワードの再入力', with: ''
      # 新規登録ボタンを押しても、ユーザーモデルのカウントが上がらないことを確認する
      expect{
        find('input[name="commit"]').click
        sleep 1
      }.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      expect(page).to have_current_path(new_user_registration_path)

      # 現状、画面遷移した場合にメニューアイコンのクリックからメニューを表示できないため
      # 新規登録ページに移動する
      visit new_user_registration_path
      # メニューアイコンをクリックすると、ログインページへ遷移するリンクや新規登録ページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('ログイン')
      expect(page).to have_content('新規登録')
      # ログインページへ遷移するリンクや新規登録ページへ遷移するリンクが表示されていないことを確認する
      expect(page).to have_no_content('ログアウト')
    end
  end

end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end
  context 'ログインができるとき' do
    it '保存されているユーザーの情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # メニューアイコンをクリックすると、ログインページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('ログイン')
      # ログインリンクをクリックすると、ログインページへ遷移することを確認する
      click_link 'ログイン'
      expect(page).to have_content('ログイン')
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: @user.email
      fill_in 'パスワード', with: @user.password
      # ログインボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(page).to have_current_path(root_path)

      # 現状、画面遷移した場合にメニューアイコンのクリックからメニューを表示できないため
      # トップページに移動する
      visit root_path
      # メニューアイコンをクリックすると、ログアウトページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('ログアウト')
      # ログインページへ遷移するリンクや新規登録ページへ遷移するリンクが表示されていないことを確認する
      expect(page).to have_no_content('ログイン')
      expect(page).to have_no_content('新規登録')
    end
  end
  context 'ログインができないとき' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # トップページに移動する
      visit root_path
      # メニューアイコンをクリックすると、ログインページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('ログイン')
      # ログインリンクをクリックすると、ログインページへ遷移することを確認する
      click_link 'ログイン'
      expect(page).to have_content('ログイン')
      # ユーザー情報を入力する
      fill_in 'メールアドレス', with: ''
      fill_in 'パスワード', with: ''
      # ログインボタンを押す
      find('input[name="commit"]').click
      # 新規登録ページへ戻されることを確認する
      expect(page).to have_current_path(new_user_session_path)

      # 現状、画面遷移した場合にメニューアイコンのクリックからメニューを表示できないため
      # ログインページに移動する
      visit new_user_session_path
      # メニューアイコンをクリックすると、ログインページへ遷移するリンクや新規登録ページへ遷移するリンクがあることを確認する
      find('#header_menu-icon').click
      sleep 1
      expect(page).to have_content('ログイン')
      expect(page).to have_content('新規登録')
      # ログインページへ遷移するリンクや新規登録ページへ遷移するリンクが表示されていないことを確認する
      expect(page).to have_no_content('ログアウト')
    end
  end
end
