Pod::Spec.new do |s|
  s.name         = "LYCircleView"
  s.version      = "0.0.1"
  s.summary      = "A common fan menu for pages such as remote controls"
  s.homepage     = "https://github.com/liaoyuanng/LYCircleView"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "JuLiaoyuan" => "stu0615@163.com" }
  s.source       = { :git => "https://github.com/liaoyuanng/LYCircleView.git", :tag => "#{s.version}" }
  s.source_files  = "LYCircleView", "LYCircleView/**/*.{h,m}"
  s.requires_arc = true
end
