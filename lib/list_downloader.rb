require 'open-uri'
require 'date'

class ListDownloader
  def download
    parse(get)
  end

  def get
    irc_info = open("http://irc.netsplit.de/channels/?net=Rizon&chat=FODArray").read.gsub("&#8203;", "")
    irc_info =~ /List A: (.*?) List B: (.*?)</
    list_a = $1
    list_b = $2

    open(list_a).read.split("\n") + open(list_b).read.split("\n")
  end

  def parse(lines)
    lines.map do |line|
      /^(?<file_id>.........)"(?<file_name>.*?)" (?<file_size>.*?) (?<file_date>.*?)$/ =~ line
      file_id.strip!
      file_size.gsub!(/MB$/, '')
      file_date = Date.strptime(file_date, '%m/%d/%Y').strftime('%Y-%m-%d')

      [file_id, file_name, file_size, file_date]
    end
  end
end