class PagesController < ApplicationController


    def index
        if current_user != nil
          redirect_to(user_path(current_user))
        end
    end

end
