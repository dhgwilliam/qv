class QV
  def self.notes_dir(args = {})
    conf_path = File.join( ENV["HOME"], ".nvalt" )
    if File.exist?(conf_path)
      config_file = File.read(conf_path)
      config_file.match(/(?<=notes_dir = ).*$/)[0] 
    else
      File.join( ENV["HOME"], "notes" )
    end
  end
end
