class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :messages
  has_many :chats, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_one_attached :avatar

  acts_as_followable
  acts_as_follower

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :nickname
    validates :email
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, allow_blank: true }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, allow_blank: true }
    validates :first_name_kana, format: { with: /\A[ァ-ヶ]+\z/, allow_blank: true }
    validates :last_name_kana, format: { with: /\A[ァ-ヶ]+\z/, allow_blank: true }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, numericality: {with: /\A[0-9]+\z/}
  end

  def self.guest
    find_or_create_by!(test_image: 'https://krwsjapan.conohawing.com/wp-content/uploads/2020/11/Screenshot_at_Nov_06_23-58-09-removebg-preview.png', nickname: 'ゲスト', email: 'guest@example.com', first_name: '山田', last_name: '太郎', first_name_kana: 'ヤマダ', last_name_kana: 'タロウ', postal_code: '123-4567', prefecture_id: '27', city: '大阪市', address: '天王寺区', phone_number: '09012345678') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end
