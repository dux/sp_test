RSpec.describe LogPresenter do
  context 'class' do
    it 'has a valid version' do
      parts = described_class::VERSION.split('.')
      expect(parts.length).to eq(3)
    end
  end

  context 'instance' do
    let!(:log_presenter) do
      log_parser = LogParser.new file: './spec/fixtures/webserver.log'
      described_class.new log_parser
    end

    let!(:quiet_log_presenter) do
      log_parser = LogParser.new file: './spec/fixtures/webserver.log', quiet: true
      described_class.new log_parser
    end

    it 'breaks unless it gets LogParser instance' do
      expect { described_class.new({}) }.to raise_error ArgumentError
    end

    it '#section' do
      expected  = '# foo'.yellow
      expected += "\nbar\n"
      expect { log_presenter.section('foo') { print 'bar' } }.to output(expected).to_stdout
    end

    it '#section - quiet' do
      expect { quiet_log_presenter.section('foo') { print 'bar' } }.to output('bar').to_stdout
    end

    it '#list' do
      expected  = ['# foo'.yellow + ' (total of 500)']
      expected.push "/about/2      90 bars"
      expected.push "/contact      89 bars"
      expected.push "/index        82 bars"
      expected.push "/about        81 bars"
      expected.push "/help_page/1  80 bars"
      expected.push "/home         78 bars"
      expected.push $/
      expect { log_presenter.list(:most_viewed_pages, 'foo', 'bar') }.to output(expected.join($/)).to_stdout
    end
  end
end