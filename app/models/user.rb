class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchase_histories

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }
  with_options presence: true do
    validates :nickname
    validates :date_of_birth
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze } do
      validates :last_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヴ一]+\z/.freeze } do
      validates :last_name_kana
      validates :first_name_kana
    end
  end
end
