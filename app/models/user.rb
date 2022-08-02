class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save :set_user_info
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :restaurants

  validates :name, presence: { message: 'İsim alanı zorunludur' },
                   length: { in: 2..20, too_long: 'İsim en fazla %<count>s karakterden oluşabilir', too_short: 'İsim alanı en az 2 karakterden oluşmalıdır' }
  validates :surname, presence: { message: 'Soyisim alanı zorunludur' },
                      length: { in: 2..25, too_long: 'Soyisim en fazla %<count>s karakterden oluşabilir', too_short: 'Soyisim alanı en az 2 karakterden oluşmalıdır' }
  validates :phone, presence: { message: 'Telefon alanı zorunludur' },
                    length: { is: 10, message: 'Telefon 10 haneden oluşmalıdır' }, uniqueness: { message: 'Bu telefon numarası zaten kayıtlı' }, numericality: { message: 'Telefon sadece rakamlardan oluşabilir' }

  def set_user_info
    self.email = email.downcase
    self.name = name.capitalize
    self.surname = surname.upcase
  end
end
