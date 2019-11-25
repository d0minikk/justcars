class Api::OffersQuery < Api::BaseQuery
  def results
    prepare_query
    title_filter
    price_filter
    order_results
    paginate_result
  end

  private

  def prepare_query
    @results = Offer.all
  end

  def title_filter
    return if filters[:title].blank?

    @results = @results.where(title: filters[:title])
  end

  def price_filter
    return if filters['price_cents_from'].blank? && filters['price_cents_to'].blank?

    filters['price_cents_from'] ||= 0
    filters['price_cents_to'] ||= max_price

    @results = @results.where(
      "price_cents >= ? AND price_cents <= ?",
      filters['price_cents_from'],
      filters['price_cents_to'],
    )
  end

  def max_price
    @max_price ||= Offer.maximum('price_cents')
  end
end
