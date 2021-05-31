class RecordPdf < Prawn::Document

# recordにモデルなどのデータを渡します
def initialize(record)

  # superで初期設定を指定します(ページサイズ、マージン等)
  super(
    page_size: 'A4',
    top_margin: 40,
    bottom_margin: 30,
    left_margin: 20,
    right_margin: 20
  )
  
  @time = Time.new
  @time = @time.since(2.days).in_time_zone('Tokyo')
  font_families.update('Test' => { normal: 'app/assets/fonts/ipag.ttf', bold: 'app/assets/fonts/ipagp.ttf' })
  font 'Test' # fontをパスで指定
  
  stroke_axis #座標を表示
  @record = record # インスタンスを受け取り。コンポーネント作成時などにレコード内のデータを使える
  image 'app/assets/images/shibamata_logo.png', at: [163, 800], width: 250, height: 50
  text_box "輸送依頼書", size: 20, align: :center, at: [0, 730]
  stroke_horizontal_line 225, 330, :at => 710
  text_box "柴又運輸（株）　東日本配車センター　御中", size: 15, at: [0, 680]
  text_box "#{@time.ago(2.days).strftime('%Y年%-m月%-d日')}", size: 13, at: [470, 680], valign: :center, height: 15
  text_box "集荷日時: ", size: 13, at: [0, 630], height: 30, valign: :center
  text_box "#{@time.strftime('%Y年%-m月%-d日')}", size: 13, at: [75, 630], height: 30, valign: :center
  stroke_horizontal_line 75, 200, :at => 605
  text_box "時間  :  指定なし", size: 13, at: [300, 630], height: 30, valign: :center
  stroke_horizontal_line 350, 500, :at => 605
  text_box "車種: ", size: 13, at: [0, 600], height: 30, valign: :center
  text_box "４t １台", size: 13, at: [75, 600], height: 30, valign: :center
  stroke_horizontal_line 75, 200, :at => 575
  text_box "集荷会社名: ", size: 13, at: [0, 570], height: 30, valign: :center
  text_box "エムエスケー農業機械株式会社", size: 13, at: [75, 570], height: 30, valign: :center
  stroke_horizontal_line 75, 500, :at => 545
  text_box "集荷場所: ", size: 13, at: [0, 540], height: 30, valign: :center
  text_box "千葉県山武郡芝山町岩山2315-23   丸全昭和運輸株式会社 E棟   成田物流センター  C/O DHLグローバルフォワーディングジャパン株式会社", size: 13, at: [75, 540],width: 320, height: 60, valign: :center, leading: 3
  stroke_horizontal_line 75, 500, :at => 485
  text_box "電話番号: ", size: 13, at: [0, 480], height: 30, valign: :center
  text_box "TEL 0479-70-8863    FAX 0479-70-8862", size: 13, at: [75, 480], height: 30, valign: :center
  stroke_horizontal_line 75, 500, :at => 450
  text_box "担当者: ", size: 13, at: [0, 445], height: 30, valign: :center
  text_box "", size: 13, at: [75, 445], height: 30, valign: :center
  stroke_horizontal_line 75, 500, :at => 415
  
  #コントローラーにて仕切り線のプログラム
  
  text_box "荷降日時: ", size: 13, at: [0, 375], height: 30, valign: :center
  text_box "#{@time.strftime('%Y年%-m月%-d日')} or #{@time.since(1.days).strftime('%-m月%-d日')}朝", size: 13, at: [75, 375], height: 30, valign: :center
  stroke_horizontal_line 75, 250, :at => 345
  text_box "時間  :  ", size: 13, at: [300, 375], height: 30, valign: :center
  stroke_horizontal_line 350, 500, :at => 345
  
  text_box "荷降会社名: ", size: 13, at: [0, 340], height: 30, valign: :center
  text_box "柴又運輸　埼玉物流センター", size: 13, at: [75, 340], height: 30, valign: :center
  stroke_horizontal_line 75, 500, :at => 310
  
  text_box "荷降場所: ", size: 13, at: [0, 305], height: 30, valign: :center
  text_box "   ", size: 13, at: [75, 305], height: 30, valign: :center
  stroke_horizontal_line 75, 500, :at => 275
  
  text_box "電話番号: ", size: 13, at: [0, 270], height: 30, valign: :center
  text_box "TEL: 048-501-2269", size: 13, at: [75, 270], height: 30, valign: :center
  stroke_horizontal_line 75, 200, :at => 240
  
  text_box "担当者: ", size: 13, at: [0, 235], height: 30, valign: :center
  text_box "　", size: 13, at: [75, 235], height: 30, valign: :center
  stroke_horizontal_line 75, 200, :at => 205
  
  text_box "荷姿: ", size: 13, at: [0, 200], height: 30, valign: :center
  text_box "パレット", size: 13, at: [75, 200], height: 30, valign: :center
  stroke_horizontal_line 75, 250, :at => 170
  text_box "重量  :  ", size: 13, at: [300, 200], height: 30, valign: :center
  text_box "   500 ", size: 13, at: [360, 200], height: 30, valign: :center
  stroke_horizontal_line 350, 500, :at => 170
  
  text_box "下記記入の上返信ください", size: 15, style: :bold,  at: [0, 130], height: 30, valign: :center

  rows = [
      ['運送会社名', 'ドライバー名', '車番', '携帯電話番号'],
      ['', '', '', ''],
      ['', '', '', '']
    ]
  
  move_down 670
  table rows, cell_style: { height: 30, width: 135, padding: 0 } do
      # 枠線なし
      # 文字サイズ
      cells.size = 15      # 枠線左と上だけ
      # 1行目はセンター寄せ
      row(0).align = :center
    end
end

end