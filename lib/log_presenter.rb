# frozen_string_literal: true

# Used to present LogParser values
class LogPresenter
  def initialize(log)
    raise ArgumentError, 'Expects instance of a LogParser class' unless log.is_a?(LogParser)
    @log = log
  end

  def section(title)
    puts "# #{title}"
    yield
    puts
  end

  def list(imethod, title, view_name)
    list  = @log.send(imethod)

    total = list
        .map { |(_, count)| count}
        .sum

    max_len = list
      .map { |(page, _)| page.length}
      .max

    section "#{title} (total of #{total})" do
      list.each do |page, views|
        puts [page.ljust(max_len + 1), views, pluralize(views, view_name)].join(' ')
      end
    end
  end

  private

  def pluralize(number, desc)
    number == 1 ? desc : "#{desc}s"
  end
end
