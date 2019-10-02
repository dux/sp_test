RSpec.describe LogParser do
  let!(:log_file) { './spec/fixtures/webserver.log' }
  let!(:log_parser) do
    described_class.new file: log_file
  end

  context 'class' do
    it 'has a valid version' do
      parts = described_class::VERSION.split('.')
      expect(parts.length).to eq(3)
    end
  end

  context 'instance' do
    it '#initialize - creates object' do
      expect(log_parser.log_file.to_s).to eq log_file
      expect(log_parser.data).to be_a Hash
    end

    it '#most_viewed_pages' do
      expected = [["/about/2", 90], ["/contact", 89], ["/index", 82], ["/about", 81], ["/help_page/1", 80], ["/home", 78]]
      expect(log_parser.most_viewed_pages).to eq expected
    end

    it '#most_unique_visitors"' do
      expected = [["/help_page/1", 23], ["/contact", 23], ["/home", 23], ["/index", 23], ["/about/2", 22], ["/about", 21]]
      expect(log_parser.most_unique_visitors).to eq expected
    end
  end
end