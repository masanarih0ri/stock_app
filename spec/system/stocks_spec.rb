require 'rails_helper'

describe '株データ管理機能', type: :system do
  # テスト内容
  # ユーザーAがログインしている時にタスクが表示される頃
  # ユーザーAがログインしていない時にタスクが表示されない

  # ユーザーの定義
  let(:user_a) { FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com') }
  let(:user_b) { FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com') }
  let!(:stock_a) { FactoryBot.create(:stock, stock_name: '日本株式会社', user: user_a) }

  before do
    visit login_path
    fill_in 'メールアドレス', with: login_user.email
    fill_in 'パスワード', with: login_user.password
    click_button 'ログインする'
  end

  shared_examples_for 'ユーザーAが作成した株データが表示される' do
    it { expect(page).to have_content '日本株式会社' }
  end

  describe '株データ一覧表示機能' do
    context 'ユーザーAがログインしているとき' do
      let(:login_user) { user_a }

      it_behaves_like 'ユーザーAが作成した株データが表示される'
    end

    context 'ユーザーBがログインしている時' do
      let(:login_user) { user_b }

      it 'ユーザーAが作成したタスクが表示されない' do
        # ユーザーAが作成したタスクの名称が画面上に表示されていないことを確認する
        expect(page).to have_no_content '日本株式会社'
      end
    end
  end

  describe '詳細表示機能' do
    context 'ユーザーAがログインしている時' do
      let(:login_user) { user_a }

      before do
        visit stock_path(stock_a)
      end

      it_behaves_like 'ユーザーAが作成した株データが表示される'
    end
  end

  describe '株データ新規作成機能' do
    let(:login_user) { user_a }

    before do
      # 新規データ作成画面へいく
      # 新規データを作成する
      # 登録するボタンをおす
      visit new_stock_path
      fill_in '銘柄名', with: stock_name
      click_button '登録する'
    end

    context '新規画面で銘柄名を入力した時' do
      let(:stock_name) { '新日本株式会社' }

      it '正常に登録される' do
        expect(page).to have_content '新日本株式会社'
      end
    end

    context '新規画面で銘柄名を入力しなかった時' do
      let(:stock_name) { '' }

      it 'エラーになる' do
        within '.card-panel' do
          expect(page).to have_content '銘柄名を入力してください'
        end
      end
    end
  end
end
