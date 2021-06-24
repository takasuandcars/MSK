class PickupRequest < ApplicationRecord
    has_many :receiveds
    default_scope -> { order(pickup_date: :desc) }
    
    scope :search, -> (search_params) do
    # search_paramsが空の場合以降の処理を行わない。
    # >> {}.blank?
    # => true
    return if search_params.blank?

    # パラメータを指定して検索を実行する
    car_type_is(search_params[:car_type])
      .date_from(search_params[:start_day])
      .date_to(search_params[:end_day])
    #それぞれのメソッドは↓で定義している
    end
      # awbが存在する場合、awbをlike検索する
      scope :car_type_is, -> (car_type) { where('car_type LIKE ?', "%#{car_type}%") if car_type.present? }
      scope :date_from, -> (from) { where('? <= pickup_date', from) if from.present? }
      scope :date_to, -> (to) { where('pickup_date <= ?', to) if to.present? }
      
end