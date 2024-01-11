RSpec.describe "ResourceScanner", type: :feature do
  it "returns all resource files" do
    scanner = AvoLinter::Scanners::ResourceScanner.new(path: DUMMY_PATH, scan:)
    files = scanner.send(:resource_files)

    expect(files.keys).to eq([
      "#{DUMMY_PATH}/app/avo/resources/account.rb",
      "#{DUMMY_PATH}/app/avo/resources/user.rb"
    ])
  end
end
