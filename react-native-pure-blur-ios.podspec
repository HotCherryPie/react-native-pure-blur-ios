Pod::Spec.new do |s|
  s.name         = "react-native-pure-blur-ios"
  s.version      = "0.0.1"
  s.platform     = :ios, "8.0"
  s.source_files  = "ios/*.{h,m,swift}"

  s.requires_arc = true

  s.authors       = { "x" => "x@x.x" }
  s.license       = "MIT"
  s.summary       = "Some summary"
  s.homepage      = "https://github.com"
  s.source        = { :git => "https://github.com" }

  s.dependency "React"
  s.dependency "PureBlurEffect"
end
