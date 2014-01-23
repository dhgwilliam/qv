module Dir
  def includes?(match)
  end
end

task :clean do
  `rm *.gem` if Dir.entries(File.dirname(__FILE__)).collect {|f| f.match(/.*\.gem$/)}.inject {|truth, match| match || truth }
end

task :build do
  `gem build qv.gemspec`
end

task :install => [:clean, :build] do
  `gem install ./qv-*.gem`
end

