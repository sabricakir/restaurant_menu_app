class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :foods

  validates :name, presence: {message:"İsim alanı zorunludur"}, length: {in: 2..60 , too_long: "İsim en fazla %{count} karakterden oluşabilir", too_short: "İsim alanı en az 2 karakterden oluşmalıdır" }

end
