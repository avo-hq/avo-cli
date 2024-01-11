shared_context "default_scan" do
  let(:scan) { AvoLinter::Scanner.new }
  let(:path) { DUMMY_PATH }
end
