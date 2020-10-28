class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many    :items
  has_many    :orders

  #空白は不可
  validates :nickname, :email, :password, :encrypted_password, :family_name, :first_name, :kana_family_name, :kana_first_name, :birth_date, presence: true

  #全角 漢字・ひらがな・カタカナ以外は不可
  with_options format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :family_name, :first_name
  end

  #全角 カタカナ以外は不可
  with_options format:{ with: /\A[ァ-ン]+\z/, message: '全角カタカナを使用してください'} do
    validates :kana_family_name, :kana_first_name
  end

  #半角 英数字混合でなければ不可
  with_options format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: '半角英数字を使用してください' } do
    validates :password
  end
end
