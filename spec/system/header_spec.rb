require 'rails_helper'

describe 'ヘッダーのテスト' do
  describe 'ログインしていない場合' do
    before do
      visit root_path
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'Bookers'
      end
      it 'Homeリンクが表示される' do
        is_expected.to have_content 'Home'
      end
      it 'Aboutリンクが表示される' do
        is_expected.to have_content 'About'
      end
      it 'Sign upリンクが表示される' do
        is_expected.to have_content 'Sign up'
      end
      it 'loginリンクが表示される' do
        is_expected.to have_content 'login'
      end
    end
    context 'ヘッダーのリンクを確認' do
      subject { current_path }
      it 'Home画面に遷移する' do
        click_link 'Home'
        is_expected.to eq(root_path)
      end
      it 'About画面に遷移する' do
        click_link 'About'
        is_expected.to eq(home_about_path)
      end
      it '新規登録画面に遷移する' do
        click_link 'Sign up'
        is_expected.to eq(new_user_registration_path)
      end
      it 'ログイン画面に遷移する' do
        click_link 'login'
        is_expected.to eq(new_user_session_path)
      end
    end
  end

  describe 'ログインしている場合' do
    let(:user) { create(:user) }
    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'Log in'
    end
    context 'ヘッダーの表示を確認' do
      subject { page }
      it 'タイトルが表示される' do
        is_expected.to have_content 'Bookers'
      end
      it 'Homeリンクが表示される' do
        is_expected.to have_content 'Home'
      end
      it 'Usersリンクが表示される' do
        is_expected.to have_content 'Users'
      end
      it 'Booksリンクが表示される' do
        is_expected.to have_content 'Books'
      end
      it 'logoutリンクが表示される' do
        is_expected.to have_content 'logout'
      end
    end

    context 'ヘッダーのリンクを確認' do
      it 'Home画面に遷移する' do
        click_link 'Home'
        expect(current_path).to eq('/users/'+user.id.to_s)
      end
      it 'Users画面に遷移する' do
        click_link 'Users'
        expect(current_path).to eq('/users')
      end
      it 'Books画面に遷移する' do
        click_link 'Books'
        expect(current_path).to eq('/books')
      end
      it 'logoutする' do
        click_link 'logout'
        expect(page).to have_content 'Signed out successfully.'
      end
    end
  end
end