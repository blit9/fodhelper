require 'open-uri'
require 'cgi'
require 'csv'

class ListDownloader
  def download
    save(request_list)
  end

  def request_list
    irc_info = open("http://irc.netsplit.de/channels/?net=Rizon&chat=FODArray").read.gsub("&#8203;", "")
    irc_info =~ /List A: (.*?) List B: (.*?)</
    list_a = $1
    list_b = $2

    open(list_a).read.split("\n") + open(list_b).read.split("\n")
  end

  def save(lines)
    CSV.open(Build.lists_path, "w") do |csv|
      lines.each do |line|
        line =~ /^(.........)"(.*?)" (.*?) (.*?)$/
        file_id = $1.strip
        file_name = $2
        file_size = $3
        file_date = $4

        csv << [file_id, file_name, file_size, file_date]
      end
    end
  end
end