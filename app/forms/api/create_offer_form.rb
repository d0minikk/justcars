class Api::CreateOfferForm
  include ActiveModel::Model

  attr_reader :title, :description, :price

  def attributes
    {
      title: title,
      description: description,
      price: price,
    }
  end
end
