require 'rails_helper'

RSpec.describe TouringplansSync, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("I am touring plans park sync")
    end
  end
  
  
end
