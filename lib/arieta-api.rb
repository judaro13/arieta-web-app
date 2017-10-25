require 'net/http/post/multipart'

class ArietaApi
  def deploy(file_path)
    url = URI.parse('http://localhost:3001/v1/')
    File.open(file_path) do |file|
      req = Net::HTTP::Post::Multipart.new( url.path,
        "services" => UploadIO.new(file, "application/json", File.basename(file_path)))
      res = Net::HTTP.start(url.host, url.port) do |http|
        http.request(req)
      end
    end
  end

  def service_status(service_name)
    url = URI.parse('http://localhost:3001/v1/pods/'+service_name)
    http = Net::HTTP.new(url.host, url.port)
    data = http.get(url.request_uri)
  end
end
