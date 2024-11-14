class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @countries_statuses = CountryStatus.includes(:user, :country).where(user_id: params[:id])
  end
end
