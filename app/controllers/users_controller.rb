class UsersController < ApplicationController
before_filter :authenticate_user!

  def show
  @user = User.find_by_email(params[:id])
    if @user
     @contacts = @user.contacts.all
     render action: :show
    end
  end

end

#if current_user.user_type == nil
#        current_user.user_type == 'Basic'
 #       current_user.save
  #  end
   # if current_user.user_type == 'Premium'
    #    current_user.save
  #  end
 # end
