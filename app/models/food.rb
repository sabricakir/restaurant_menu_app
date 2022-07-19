class Food < ApplicationRecord
  belongs_to :restaurant
  has_one :category

  validates :name, presence: {message:"İsim alanı zorunludur"}, length: {in: 2..40 , too_long: "İsim en fazla %{count} karakterden oluşabilir", too_short: "İsim alanı en az 2 karakterden oluşmalıdır" }
  validates :contents, length: {in: 2..80 , too_long: "İçerik en fazla %{count} karakterden oluşabilir", too_short: "İçerik alanı en az 2 karakterden oluşmalıdır" }
  validates :price, presence: {message:"Fiyat alanı zorunludur"}

end
