Pod::Spec.new do |s|
  s.name         = "InjectStory"
  s.version      = "0.1"
  s.summary      = "Simple dependency injection framework for Swift"
  s.homepage     = "https://github.com/MaciejGad/InjectStory"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Maciej Gad" => "https://github.com/MaciejGad" }
  s.social_media_url   = "https://twitter.com/maciej_gad"
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/MaciejGad/InjectStory.git", :tag => 'v0.1' }
  s.source_files  =  "Source/*.swift"
  s.requires_arc = true

end