module DataHelper

  def parse_data
    JSON.parse(File.read(Dir.pwd+'/apps/helper/data.json'))
  end

end