Pod::Spec.new do |s|
  s.name         = "LTableViewAdapter"
  s.version      = "1.0.0"
  s.summary      = "这是一个 UITableView 的适配器"
  s.homepage     = "https://github.com/banchichen/LTableViewAdapter"
  s.license      = "MIT"
  s.author       = { "banchichen" => "tanzhenios@foxmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "6.0"
  s.source       = { :git => "https://github.com/banchichen/LTableViewAdapter.git", :tag => "1.7.0" }
  s.requires_arc = true
  s.resources    = "LTableViewAdapter/LTableViewAdapter/*.{png,xib,nib,bundle}"
  s.source_files = "LTableViewAdapter/LTableViewAdapter/*.{h,m}"
end
