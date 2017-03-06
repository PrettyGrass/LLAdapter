Pod::Spec.new do |s|
  s.name         = "LTableViewAdapter"
  s.version      = "1.0.0"
  s.summary      = "这是一个 UITableView 的适配器"
  s.homepage     = "ylin.club:/blog"
  s.license      = "MIT"
  s.author       = { "banchichen" => "tanzhenios@foxmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "6.0"
  s.source       = { :git => "...", :tag => "1.1.0" }
  s.requires_arc = true
  s.resources    = "LTableViewAdapter/**/*.{png,xib,nib,bundle}"
  s.source_files = "LTableViewAdapter/**/*.{h,m}"
end
