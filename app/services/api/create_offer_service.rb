class Api::CreateOfferService
  attr_reader :form, :record

  def initialize(form:)
    @form = form
  end

  def call
    return false unless form.valid?

    create_record
  end

  private

  def create_record
    @record = Offer.create(form.attributes)
  end
end
