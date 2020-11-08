class UsersController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render user_registration_path
    end
    # @user = User.find(params[:id])
    # if current_user.id == @user.id
    #   if @user.update(user_params)
    #     flash[:success] = 'ユーザー情報を編集しました。'
    #     render users_path
    #   else
    #     flash.now[:danger] = 'ユーザー情報の編集に失敗しました。'
    #     render :edit
    #   end
    # else
    #     redirect_to root_path
    # end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render 
    end
  end

  def show
    @user = User.find(params[:id])
    @current_user_entry = Entry.where(user_id: current_user.id)
    @user_entry = Entry.where(user_id: @user.id)
    unless @user.id == current_user.id
      @current_user_entry.each do |cu|
        @user_entry.each do |u|
          if cu.room_id == u.room_id then
            @is_room = true
            @room_id = cu.room_id
          end
        end
      end
      if @is_room
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    redirect_to user_path(@user)
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.stop_following(@user)
    redirect_to user_path(@user)
  end


  def follow_list
    @user = User.find(params[:user_id])
  end

  def follower_list
    @user = User.find(params[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :avatar, :first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end
end
