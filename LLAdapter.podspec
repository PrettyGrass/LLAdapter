Pod::Spec.new do |s|
  s.name         = "LLAdapter"
  s.version      = "2.0.0"
  s.summary      = "UITableView/UICollectionView 的适配器. 助你优雅的构建UITableView/UICollectionView, 分离控制器和cell的逻辑."
  s.homepage     = "https://github.com/y0love/LLAdapter"
  s.license      = "MIT"
  s.author       = { "ylin8890" => "ylin8890@gmail.com" }
  s.platform     = :ios
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/y0love/LLAdapter.git", :tag => s.version.to_s }
  s.requires_arc = true

  s.public_header_files = "LLAdapter/**/*.{h}"
  s.source_files = "LLAdapter/**/*.{h,m}"

end

