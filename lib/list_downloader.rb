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
      line =~ /^(.........)"(.*?)" (.*?) (.*?)$/
      file_id = $1.strip
      file_name = $2
      file_size = $3
      file_date = Date.strptime($4, '%m/%d/%Y').strftime('%Y-%m-%d')

      { file_id: file_id, file_name: file_name, file_size: file_size, file_date: file_date }
    end
  end
end