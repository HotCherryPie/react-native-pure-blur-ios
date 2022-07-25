Pod::Spec.new do |s|
  s.name         = "PureBlurEffect"
  s.version      = "0.0.1"
  s.platform     = :ios, "8.0"
  s.source_files  = "*.{h,m,swift}"
  s.swift_version = "4.0"

  s.requires_arc = true

  s.authors       = { "x" => "x@x.x" }
  s.license       = "MIT"
  s.summary       = "Some summary"
  s.homepage      = "https://github.com"
  s.source        = { :git => "https://github.com" }
end
