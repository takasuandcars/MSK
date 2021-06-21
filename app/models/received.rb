class Received < ApplicationRecord
    belongs_to :pickup_request, required: false
    
    
    scope :search, -> (search_params) do
    # search_paramsが空の場合以降の処理を行わない。
    # >> {}.blank?
    # => true
    return if search_params.blank?

    # パラメータを指定して検索を実行する
    awb_is(search_params[:awb])
      .inv_is(search_params[:inv])
      .date_from(search_params[:start_day])
      .date_to(search_params[:end_day])
    end
      # awbが存在する場合、awbをlike検索する
      scope :awb_is, -> (awb) { where('awb LIKE ?', "%#{awb}%") if awb.present? }
      # invが存在する場合、invで検索する
      scope :inv_is, -> (inv) { where('invoice LIKE ?', "%#{inv}%") if inv.present? }
      # received_dateが存在する場合、received_dateで範囲検索する
      scope :date_from, -> (from) { where('? <= received_date', from) if from.present? }
      scope :date_to, -> (to) { where('received_date <= ?', to) if to.present? }
end

