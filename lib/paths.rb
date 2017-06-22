require 'pathname'

module Paths
  def self.root_path
    Pathname.new(__FILE__).dirname.parent
  end

  def self.app_path
    root_path + 'app'
  end

  def self.list_path
    app_path + 'list.json'
  end

  def self.list_js_path
    app_path + 'list.js'
  end
end