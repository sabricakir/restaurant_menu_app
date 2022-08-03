class Food < ApplicationRecord
  belongs_to :restaurant
  has_one :category
  before_save :set_food_info

  validates :name, presence: { message: 'İsim alanı zorunludur' },
                   length: { in: 2..40, too_long: 'İsim en fazla %<count>s karakterden oluşabilir', too_short: 'İsim alanı en az 2 karakterden oluşmalıdır' }
  validates :contents,
            length: { in: 2..80, too_long: 'İçerik en fazla %<count>s karakterden oluşabilir',
                      too_short: 'İçerik alanı en az 2 karakterden oluşmalıdır' }
  validates :price, presence: { message: 'Fiyat alanı zorunludur' }

  private

  def set_food_info
    self.name = name.capitalize
    self.contents = contents.titleize
  end
end
