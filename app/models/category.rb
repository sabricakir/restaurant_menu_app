class Category < ApplicationRecord

  validates :name, presence: {message:"İsim alanı zorunludur"}, length: {in: 2..40 , too_long: "İsim en fazla %{count} karakterden oluşabilir", too_short: "İsim alanı en az 2 karakterden oluşmalıdır" }

end
