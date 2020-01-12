require 'rails_helper'

describe 'トップページのテスト' do
  let(:user) { create(:user) }
  before do
    visit root_path
  end
  describe 'ボディ部分のテスト' do
    context '表示の確認' do
      it 'Log inリンクが表示される' do
        expect(page).to have_link 'Log in', href: new_user_session_path
      end
      it 'Sign Upリンクが表示される' do
        expect(page).to have_link 'Sign up', href: new_user_registration_path
      end
    end

    context 'ログインしている場合の挙動を確認' do
      it 'Log inリンクをクリックしたらユーザー詳細画面へ遷移する' do
        visit new_user_session_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit root_path

        click_link 'Log in'
        expect(page).to have_content 'User info'
      end
      it 'Sign upリンクをクリックしたらユーザー詳細画面に遷移する' do
        visit new_user_session_path
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
        visit root_path

        click_link 'Sign Up'
        expect(page).to have_content 'User info'
      end
    end

    context 'ログインしていない場合の挙動を確認' do
      it 'Log inリンクをクリックしたらログイン画面へ遷移する' do
        click_link 'Log in'
        expect(current_path).to eq(new_user_session_path)
      end
      it 'Sign Upリンクをクリックしたら新規登録画面に遷移する' do
        click_link 'Sign up'
        expect(current_path).to eq(new_user_registration_path)
      end
    end
  end
end