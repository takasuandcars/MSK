class RecordPdfsController < ApplicationController
  def index
    
    @records = PickupRequest.find_by(id: params[:id]) # pdf上で使用するレコードのインスタンスを作成
    
    respond_to do |format|
      format.html
      format.pdf do

        # pdfを新規作成。インスタンスを渡す。
        
        pdf = RecordPdf.new(@records) #app/pdfs/record_pdf.rb
        
        #クラスの中で書いたらうまくいかなかったので↓に書いた（ライン）
        pdf.line_width = 15
        pdf.line([0,395], [550, 395])
        pdf.stroke_color("CCCCCC") 
        pdf.stroke
        
        #クラスの中で書いたら重い？のか動かなかったので↓に書いた
         rows = [['運送会社名', 'ドライバー名', '車番', '携帯電話番号'], ['', '', '', ''], ['', '', '', '']]
    
         pdf.move_down 670 
         pdf.table rows, cell_style: { height: 30, width: 137, padding: 0 } do
          # 文字サイズ
            cells.size = 15      
          # 1行目はセンター寄せ
            row(0).align = :center
        end
        
        send_data pdf.render,
          filename:    "輸送依頼書.pdf",
          type:        "application/pdf",
          disposition: "inline" # 画面に表示。外すとダウンロードされる。
          
      end
    end
    
  end
end
