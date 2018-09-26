Pod::Spec.new do |s|
  s.name         = "LLAdapter"
  s.version      = "1.2.0"
  s.summary      = "这是一个 UITableView 的适配器"
  s.homepage     = "http://ylin.club"
  s.license      = "MIT"
  s.author       = { "ylin8890" => "ylin8890@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "git@g.dou-pai.com:ios_component/LLAdapter.git", :branch => "1.2.0" }
  s.requires_arc = true

  s.public_header_files = "LLAdapter/**/*.{h}"
  s.resources    = "LLAdapter/**/*.{png,xib,nib,bundle}"
  s.source_files = "LLAdapter/**/*.{h,m}"

end
