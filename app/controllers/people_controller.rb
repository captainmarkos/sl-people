class PeopleController < ApplicationController
  before_action :load_api, only: [:index]
  before_action :load_pagination, only: [:index]

  def index
    response = @people_api.fetch(@page, @per_page)
    @people = load_people(response).paginate(page: @page, per_page: @per_page)
  end

  private

  def load_people(response)
    total_count = response['metadata']['paging']['total_count']
    current_page = response['metadata']['paging']['current_page'].to_i

    @people ||= (1..total_count).reduce([]) { |r, _i| r << {} }

    start = (current_page - 1) * @per_page
    @people.slice!(start, @per_page)
    @people.insert(start, response['data']).flatten!
  end

  def load_api
    @people_api = People::Api.new
  end
end
