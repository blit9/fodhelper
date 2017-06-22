require_relative './lib/fodhelper.rb'

task :build do
  ListSaver.new(ListDownloader.new.download).save
end

task default: :build