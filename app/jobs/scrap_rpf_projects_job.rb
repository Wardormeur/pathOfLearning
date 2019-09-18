# TODO : split recovery from source ?
class ScrapRpfProjectsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    res = Net::HTTP.get_response(URI("https://learning-admin.raspberrypi.org/api/v1/en/projects"))
    tutorials = ActiveSupport::JSON.decode(res.body)
    tutorials["data"].each do |tutorial|
      attr = tutorial["attributes"]
      Resource.create :name => attr["content"]["title"], :type_of => "html", :url => "https://projects.raspberrypi.org/en/projects/#{attr["repositoryName"]}"
    end
  end
end
