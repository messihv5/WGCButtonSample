Pod::Spec.new do |s|

  s.name         = "WGCButton"

  s.version      = "0.0.1"

  s.summary      = "A custom button"

  s.description  = <<-DESC
    A custom button that allows you to position the image top, left, bottom, right.
                   DESC
  s.homepage     = "https://github.com/messihv5/WGCButtonSample"

  s.license      = "MIT"

  s.author             = { "messihv5" => "email@address.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/messihv5/WGCButtonSample.git", :tag=>"0.0.1"}

  s.source_files  = "WGCButton/*.{h,m}"

  s.requires_arc = true

  s.dependency "YYKit"

end
