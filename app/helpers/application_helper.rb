module ApplicationHelper

  def user_avatar(user, size=250)
    if user.avatar.attached?
      user.avatar.variant(resize_to_fill: [150, nil])
    else
      gravatar_image_url("default")
    end
  end
  
end
