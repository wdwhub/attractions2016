require 'rails_helper'

RSpec.describe AttractionSync, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  describe '#title' do
    it 'works' do
      expect(subject.title).to eq("attraction sync")
    end
  end
  
end
