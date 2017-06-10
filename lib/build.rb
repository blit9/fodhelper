module Build
  def self.root_path
    Pathname.new(__FILE__).dirname.parent
  end

  def self.lists_path
    root_path + 'lists.csv'
  end

  def self.build_path
    root_path + 'build'
  end

  def self.output_path
    if ENV.key?('FODHELPER_OUTPUT_DIR')
      Pathname.new(ENV['FODHELPER_OUTPUT_DIR'])
    else
      root_path + 'output'
    end
  end
end