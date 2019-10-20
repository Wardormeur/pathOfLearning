# TODO : split recovery from source ?
class ScrapRpfProjectsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    index = 0 
    page_nb = get_size
    while index < page_nb do
      url = URI("https://learning-admin.raspberrypi.org/api/v1/en/projects")
      url.query = Rack::Utils.build_nested_query({
		"page" => {
		  "number" => index,
          "size" => 30
        }
	  })
      res = Net::HTTP.get_response(url)
      tutorials = ActiveSupport::JSON.decode(res.body)
      Resource.transaction do
        tutorials["data"].each do |tutorial|
          attr = tutorial["attributes"]
          Resource.create :name => attr["content"]["title"], :type_of => "html", :url => "https://projects.raspberrypi.org/en/projects/#{attr["repositoryName"]}"
        end
      end
      index += 1
    end
  end
  def get_size()
    res = Net::HTTP.get_response(URI("https://learning-admin.raspberrypi.org/api/v1/en/projects"))
    tutorials = ActiveSupport::JSON.decode(res.body)
    # we don't use next because it means we can inspect the number of pages to scrap
    last_url = URI::parse(tutorials['links']['last'])
    query = Rack::Utils.parse_nested_query(last_url.query)
    return query.dig("page", "number").to_i || 0
  end
end
