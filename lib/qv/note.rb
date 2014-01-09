require 'qv/qvconfig'

class Note
  attr_reader :filename

  def initialize(args)
    @filename = args[:file]
    @title = title
    @path = path
  end

  def title
    @title || File.basename(@filename, File.extname(@filename))
  end

  def path
    @path || File.join(QV.notes_dir,@filename)
  end

  def get_io
    File.open(@path)
  end

  def matches?(search_term)
    begin
      get_io.read.match(/^.*#{search_term}.*$/i)
    rescue ArgumentError => e
      puts "ERR: Contents of #{@filename}\n#{e}"
    end
  end

  def title_matches?(search_term)
    begin
      @title.match(/^.*#{search_term}.*$/i)
    rescue ArgumentError => e
      puts "ERR: Filename of #{@filename}\n#{e}"
    end
  end

  def edit
    editor = ENV["EDITOR"] || '/usr/bin/vim'
    exec "#{editor} \"#{path}\";clear"
    system "clear"
  end

  def self.sort_notes_by_date(notes)
    notes.sort_by! { |note|
      File.mtime(note.path)}
    notes.reverse!
  end

  def self.get_notes
    note_names = Dir.entries(QV.notes_dir).reject do |note_filename|
      exceptions = [
        "..",
        ".",
        "Interim Note-Changes",
        "Notes & Settings"
      ]
      exceptions.include?(note_filename) || 
        note_filename.start_with?(".")
    end
    note_names.map do |file|
      Note.new(:file => file)
    end
  end
end
