module ApplicationHelper
  def pickup_exist?(received_id)
    received_data = Received.find_by(id: received_id)
    pickup = received_data.pickup_request

    if pickup
      true
    else
      false
    end
  end

  def tracker(method, awb)
    url = 'https://api.tracktry.com/v1/carriers/detect'
    postData = { "tracking_number": awb }
    headers = { 'Content-Type' => 'application/json', 'Tracktry-Api-Key': 'aae7d8f5-a58b-4dca-8638-4522da6f2921' }
    @toSend = if postData.empty?
                ''
              else
                postData.to_json
              end
    uri = URI.parse(url)
    https = Net::HTTP.new(uri.host, uri.port)
    https.use_ssl = uri.scheme === 'https'
    if method == 'GET'
      req = Net::HTTP::Get.new(uri.path, headers)
    elsif method == 'POST'
      req = Net::HTTP::Post.new(uri.path, headers)
    elsif method == 'PUT'
      req = Net::HTTP::Put.new(uri.path, headers)
    elsif method == 'DELETE'
      req = Net::HTTP::Delete.new(uri.path, headers)
    else
      puts 'parameter method is wrong!'
    end

    req.body = "#{@toSend}"
    res = https.request(req)
    res_json = JSON.parse(res.body)

    if res_json['data'][0].nil?
      nil
    else
      res_json['data'][0]['code']
    end
  end
end
