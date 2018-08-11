Pod::Spec.new do |s|
  s.name         = "LLTableViewAdapter"
  s.version      = "1.2.0"
  s.summary      = "这是一个 UITableView 的适配器"
  s.homepage     = "http://ylin.club"
  s.license      = "MIT"
  s.author       = { "ylin8890" => "ylin8890@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://git.oschina.net/y0/LLTableViewAdapter.git", :branch => "1.2.0" }
  s.requires_arc = true

  s.public_header_files = "LLTableViewAdapter/**/*.{h}"
  s.resources    = "LLTableViewAdapter/**/*.{png,xib,nib,bundle}"
  s.source_files = "LLTableViewAdapter/**/*.{h,m}"

  #   s.public_header_files = "LLTableViewAdapter/**/*.{h}"
  #   s.source_files = "LLTableViewAdapter/**/*.{h}"
  #   s.resources    = "LLTableViewAdapter/**/*.{png,xib,nib,bundle}"
  #   s.vendored_libraries = "LLTableViewAdapter_static/*.a"

end
