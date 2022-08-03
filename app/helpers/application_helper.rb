module ApplicationHelper
  def user_avatar(user, _size = 250)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fill: [150, nil])
    else
      gravatar_image_url('default')
    end
  end

  def get_restaurant_image(restaurant)
    if restaurant.restaurant_image.attached?
      restaurant.restaurant_image
    else
      gravatar_image_url('default')
    end
  end
end
