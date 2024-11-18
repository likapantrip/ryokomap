class CountriesController < ApplicationController
  def index
    get_countries
  end

  def edit
    get_countries
  end

  def update
    # ユーザーのステータス件数を取得
    get_countries
    count = @countries.count
    
    count.times do |c|
      # 更新対象+パラメーターから値を取得
      c += 1
      country_id = c.to_s
      params_country = params.require(:"country_status").require(:"countries").require(country_id).permit(:status_id)
      country_data = CountryStatus.find_by(user_id: params[:user_id], country_id: country_id)

      # データを更新
      if country_data.update(params_country) == false
        flash[:alert] = "データ更新が失敗しました"
        redirect_to user_edit_country_path
        return
      end
    end
    redirect_to root_path
  end

  private

  def get_countries
    @user = User.find(params[:user_id])
    @countries = CountryStatus.includes(:user, :country).where(user_id: params[:user_id])
  end
end
