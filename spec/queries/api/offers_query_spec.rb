require 'rails_helper'

RSpec.describe Api::OffersQuery do
  describe 'results' do
    it 'by name' do
      offer1 = FactoryBot.create(:offer, title: 'Audi A5')
      offer2 = FactoryBot.create(:offer, title: 'BMW 530')

      results = described_class.new(title: 'Audi A5').results
      expect(results.map(&:id)).to match_array([offer1.id])
    end
  end
end
