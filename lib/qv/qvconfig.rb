class QV
  @@notes_dir   = File.join( ENV["HOME"], "notes" )
  @@config_file = File.join( ENV["HOME"], ".qvrc" )

  def self.notes_dir
    @@notes_dir
  end

  def self.read_config(args = {})
    @@config_file = args[:config_file] if args[:config_file]
    if File.exist?(@@config_file)
      @@notes_dir = File.expand_path(File.read(@@config_file).match(/(?<=notes_dir = ).*$/)[0])
    end
  end

  def self.set_notes_dir(args = {})
    @@notes_dir = File.expand_path(args[:notes_dir])
  end
end
