class RecordPdfsController < ApplicationController
  def index
    @records = User.all # pdf上で使用するレコードのインスタンスを作成
    respond_to do |format|
      format.html
      format.pdf do

        # pdfを新規作成。インスタンスを渡す。
        pdf = RecordPdf.new(@records)
        
        pdf.line_width = 15
        pdf.line([0,395], [550, 395])
        pdf.stroke_color("CCCCCC") 
        pdf.stroke
        
        send_data pdf.render,
          filename:    "輸送依頼書.pdf",
          type:        "application/pdf",
          disposition: "inline" # 画面に表示。外すとダウンロードされる。
          
      end
    end
    
  end
end
