require 'qv/note'
require 'io/console'

def get_matching_notes(search_term)
  matches = 
    Note.get_notes.map do |note|
      if note.matches?(search_term) || note.title_matches?(search_term)
          note
      else
        nil
      end
    end
  matches.select { |note| note }
end

def get_input
  search_term = ""
  io = IO.console
  position = 0
  returned = false

  until returned
    char = io.getch
    case char
    when "\u007F" # backspace
      search_term.slice!(-1)
    when "\u0003" # C-c
      exit
    when "\e"  # esc
      exit
    when "\u0015" # C-u
      search_term.replace ""
    when "\r" # hard return
      returned = true
    when "\n" # C-j
      position = position + 1
    when "\v"  # C-k
      position = position - 1
    else
      search_term << char
    end
    matches = Note.sort_notes_by_date(get_matching_notes(search_term))
    display_list(search_term, matches, position)
  end
   matches[position]
end

def display_list(search_term, matches, id = 0)
  system("clear")
  puts "#{search_term}: #{matches.count}"
  notes =  matches.take(IO.console.winsize.first-2)
  puts notes.map {|note| 
    if notes.index(note) == id
      "* #{note.title}"
    else
      note.title
    end
  }
end

def launch_editor(note)
  editor = ENV["EDITOR"] || '/usr/bin/vim'
  begin
    exec "#{editor} \"#{note.path}\";clear" if note
  rescue => e
    puts e
    puts "No matching note found"
  end
  system "clear"
end


