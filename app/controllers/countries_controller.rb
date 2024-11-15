class CountriesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @countries_statuses = CountryStatus.includes(:user, :country).where(user_id: params[:user_id])
  end
end
