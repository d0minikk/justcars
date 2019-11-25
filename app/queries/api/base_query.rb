class Api::BaseQuery
  attr_accessor :filters

  def initialize(filters = {})
    @filters = filters
  end

  protected

  def order_results(default_sort = 'title', default_direction = 'desc')
    direction = filters['direction'].presence || default_direction
    sort = filters['sort'].presence || default_sort

    @results = @results.order(sort => direction)
  end

  def paginate_result
    return if filters['per'] == 'all'

    filters['per'] ||= 10
    @results = @results.page(filters['page']).per(filters['per'])
  end
end
