Pod::Spec.new do |s|
  s.name         = "LLTableViewAdapter"
  s.version      = "1.1.1"
  s.summary      = "这是一个 UITableView 的适配器"
  s.homepage     = "http://ylin.club"
  s.license      = "MIT"
  s.author       = { "ylin8890" => "ylin8890@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.dependency  'Masonry'
  s.source       = { :git => "https://git.oschina.net/y0/LLTableViewAdapter.git", :branch => "1.2.0" }
  s.requires_arc = true

  s.subspec 'default' do|ss| 
    ss.public_header_files = 'LLTableViewAdapter/**/*.{h}'
    ss.resources    = "LLTableViewAdapter/**/*.{png,xib,nib,bundle}"
    ss.source_files = "LLTableViewAdapter/**/*.{h,m}"
  end
  s.subspec 'static' do|ss| 
    ss.public_header_files = 'LLTableViewAdapter/**/*.{h}'
    ss.source_files = 'LLTableViewAdapter/**/*.{h}'
    ss.resources    = "LLTableViewAdapter/**/*.{png,xib,nib,bundle}"
    ss.vendored_libraries = 'LLTableViewAdapter_static/*.a'
  end

end
