require 'rails_helper'

RSpec.describe TouringplansConnection, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe "#title" do
    # params = {path: "whispering-canyon-cafe", yql_css_parse: 'article .entry-content p' }
    # let(:target) { OpenStruct.new(params) }
    it "works" do
      expect(subject.title).to eq("i am touring plans")
    end
  end

  
end
