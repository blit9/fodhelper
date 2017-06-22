require 'json'

class ListSaver
  def initialize(list)
    @list = list
  end

  def save
    list_json = @list.to_json
    File.open(Paths.list_path, 'w') { |f| f << list_json }
    File.open(Paths.list_js_path, 'w') { |f| f << "var list = #{list_json};" }
  end
end