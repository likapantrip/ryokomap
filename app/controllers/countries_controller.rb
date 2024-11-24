class CountriesController < ApplicationController
  def index
    get_countries
  end

  def edit
    get_countries
  end

  def update
    # ステータス件数を取得(更新回数)
    get_countries
    count = @countries.count
    
    count.times do |c|
      # 更新するcountry_idを取得
      c += 1
      c_id = c.to_s

      # 更新対象を取得
      country_data = CountryStatus.where(user_id: params[:user_id], country_id: c_id)

      # パラメーターから値を取得
      params_country = params.require(:"country_status").require(:"countries").require(country_data.to_a[0].id.to_s).permit(:status_id)
      
      # データを更新
      country_data.update!(status_id: params_country[:status_id])

      # データ更新に失敗した場合
      rescue ActiveRecord::RecordInvalid => e
        flash[:alert] = "#{e.record.errors.full_messages} ※#{Country.find(e.record.country_id).country_name}以降のデータは更新されていません"
        redirect_to user_edit_country_path
        return
    end

    # 全件更新成功した場合
    redirect_to root_path
  end

  private

  def get_countries
    @user = User.find(params[:user_id])
    @countries = CountryStatus.includes(:user, :country).where(user_id: params[:user_id])
  end
end
