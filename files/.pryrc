irbrc = File.expand_path('~/.irbrc')

if File.exists?(irbrc)
  load irbrc
end
