class CountriesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      if CountryStatus.find_by(user_id: @user.id).nil?
        count = Country.count
        count.times do |c|
          CountryStatus.create(
            user_id: @user.id,
            country_id: c+1,
            status_id: 40
          )
        end
      end

      @countries_statuses = CountryStatus.includes(:user, :country).where(user_id: @user.id)
    end
  end
end
