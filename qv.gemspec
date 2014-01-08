Gem::Specification.new do |s|
  s.name        = 'qv'
  s.version     = '0.0.5'
  s.date        = '2014-01-06'
  s.summary     = "nvalt-a-like for the cli"
  s.description = "nvalt-a-like for the cli"
  s.authors     = ["David Gwilliam"]
  s.email       = 'dhgwilliam@gmail.com'
  s.files       = ["lib/qv.rb",
                    "lib/qv/note.rb",
                    "lib/qv/qv.rb",
                    "lib/qv/qvconfig.rb"
                  ]
  s.homepage    =
    'https://github.com/dhgwilliam/qv'
  s.license       = 'Apache 2.0'
  s.executables << 'qv'
  s.add_runtime_dependency 'slop'
end
