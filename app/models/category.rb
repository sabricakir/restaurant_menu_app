class Category < ApplicationRecord
  has_one_attached :category_icon
  before_save :set_category_info

  validates :name, presence: { message: 'İsim alanı zorunludur' },
                   length: { in: 2..40, too_long: 'İsim en fazla %<count>s karakterden oluşabilir', too_short: 'İsim alanı en az 2 karakterden oluşmalıdır' }

  private

  def set_category_info
    self.name = name.upcase
  end
end
