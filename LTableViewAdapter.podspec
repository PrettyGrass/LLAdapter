Pod::Spec.new do |s|
  s.name         = "LTableViewAdapter"
  s.version      = "1.0.0"
  s.summary      = "这是一个 UITableView 的适配器"
  s.homepage     = "ylin.club:/blog"
  s.license      = "MIT"
  s.author       = { "ylin8890" => "ylin8890@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.dependency  'Masonry'
  s.source       = { :git => "...", :tag => "1.0.0" }
  s.requires_arc = true
  s.resources    = "LTableViewAdapter/**/*.{png,xib,nib,bundle}"
  s.source_files = "LTableViewAdapter/**/*.{h,m}"

end
