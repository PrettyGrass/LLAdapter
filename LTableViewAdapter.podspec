Pod::Spec.new do |s|
  s.name         = "LTableViewAdapter"
  s.version      = "1.1.1"
  s.summary      = "这是一个 UITableView 的适配器"
  s.homepage     = "http://ylin.club"
  s.license      = "MIT"
  s.author       = { "ylin8890" => "ylin8890@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.dependency  'Masonry'
  s.source       = { :git => "https://git.oschina.net/y0/LTableViewAdapter.git", :branch => "1.1.1" }
  s.requires_arc = true

  s.subspec 'default' do|ss| 
    ss.public_header_files = 'LTableViewAdapter/**/*.{h}'
    ss.resources    = "LTableViewAdapter/**/*.{png,xib,nib,bundle}"
    ss.source_files = "LTableViewAdapter/**/*.{h,m}"
  end
  s.subspec 'static' do|ss| 
    ss.public_header_files = 'LTableViewAdapter/**/*.{h}'
    ss.source_files = 'LTableViewAdapter/**/*.{h}'
    ss.resources    = "LTableViewAdapter/**/*.{png,xib,nib,bundle}"
    ss.vendored_libraries = 'LTableViewAdapter_static/*.a'
  end

end
