RSpec.describe "Fields as class methods", type: :feature do
  describe "with a field as class method" do
    let(:resource) {
      <<-RUBY

  class Avo::Resources::Account < Avo::BaseResource

    field :bad_name, as: :text

    def fields
      field :id, as: :id
    end
  end
      RUBY
    }
    it "should return an error" do
      scanner = AvoCli::Scanners::ResourceScanner.new(path:, scan:)
      scanner.scan!
      expect(scan.error_messages).to eq([AvoCli::Rules::FieldsAsClassMethods::MESSAGE])
    end
  end
end
