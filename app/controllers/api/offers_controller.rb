class Api::OffersController < Api::BaseController
  def index
    offers = Api::OffersQuery.new(index_params).results
    render json: offers
  end

  def create
    form = Api::CreateOfferForm.new(record_params)
    service = Api::CreateOfferService.new(form: form)

    if service.call
      render json: form.record, serializer: Api::OfferSerializer
    else
      render json: form.record.errors.full_messages
    end
  end

  def show
    render json: offer
  end

  private

  def offer
    @offer ||= Offer.find(params[:id])
  end

  def index_params
    params.permit(
      :title,
      :description,
      :price_cents_from,
      :price_cents_to,
      :direction,
      :sort,
      :per,
      :page
    )
  end

  def record_params
    params.require(:offer).permit(:title, :description, :price, :image)
  end
end
