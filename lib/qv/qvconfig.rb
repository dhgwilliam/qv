class QvConfig
  
  begin
    NOTES_DIR = File.read(File.join(ENV["HOME"],".nvalt")).match(/(?<=notes_dir = ).*$/)[0] 
  rescue
    NOTES_DIR = File.join(ENV["HOME"],"notes")
  end

end
