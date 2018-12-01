class PeopleController < ApplicationController
  before_action :load_api, only: [:index, :frequency]
  before_action :load_pagination, only: [:index]

  def index
    response = @people_api.fetch(@page, @per_page)

    options = {
      data: response['data'],
      per_page: @per_page,
      current_page: response['metadata']['paging']['current_page'],
      total_count: response['metadata']['paging']['total_count']
    }

    @people = load_people(options).paginate(page: @page, per_page: @per_page)
  end

  def frequency
    # Loads all the People records into @people.
    # A helper method will calculate the frequencies for the view.
    load_all_people
  end

  def possible_duplicates
    load_all_people

  end

  private

  def load_people(options)
    @people ||= (1..options[:total_count]).reduce([]) { |r, _i| r << {} }
    start = (options[:current_page] - 1) * options[:per_page]

    @people.slice!(start, options[:per_page])
    @people.insert(start, options[:data]).flatten!
  end

  def load_all_people
    per_page = 100 # max value for per_page
    response = @people_api.fetch(1, per_page)

    current_page = response['metadata']['paging']['current_page']
    total_pages = response['metadata']['paging']['total_pages']

    options = {
      data: response['data'],
      per_page: per_page,
      current_page: current_page,
      total_count: response['metadata']['paging']['total_count']
    }
    load_people(options)

    while options[:current_page] < total_pages
      options[:current_page] += 1
      response = @people_api.fetch(options[:current_page], per_page)
      options[:data] = response['data']
      load_people(options)
    end
  end

  def load_api
    @people_api = People::Api.new
  end
end
