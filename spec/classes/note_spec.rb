require 'spec_helper'
require 'rspec/mocks'

describe Note, "#new" do
  it "should have a title and a path when initialized with a filename" do
    note = Note.new(:file => 'filename.ext')
    note.filename.should eq('filename.ext')
    note.title.should eq('filename')
    note.path.should eq(File.join(QV.notes_dir,'filename.ext'))
  end

  it "should require a filename" do
    expect { Note.new }.to raise_error(ArgumentError, "Note requires a :file argument")
  end

  it "should raise an error when note title contains invalid UTF-8" do
    bad_filename = "filename\255.ext".force_encoding('UTF-8')
    expect { Note.new(:file => bad_filename ) }.to raise_error(ArgumentError, "filename\255.ext contains an invalid character")
  end
end

describe Note, "#matches?" do
  it "should raise an error when note contains invalid UTF-8" do
    note = Note.new(:file => 'filename.ext')
    note.stub(:body) { "This note contains an error\255" }
    expect { note.matches?("this") }.to raise_error(ArgumentError, "filename.ext: invalid byte sequence in UTF-8")
  end
end
