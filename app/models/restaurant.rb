class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :foods
  has_one_attached :restaurant_image

  validates :name, presence: {message:"İsim alanı zorunludur"}, length: {in: 2..60 , too_long: "İsim en fazla %{count} karakterden oluşabilir", too_short: "İsim alanı en az 2 karakterden oluşmalıdır" }
  validates :address, presence: {message:"Adres alanı zorunludur"}, length: {in: 10..250 , too_long: "Adres en fazla %{count} karakterden oluşabilir", too_short: "adres alanı en az 10 karakterden oluşmalıdır" }


end
