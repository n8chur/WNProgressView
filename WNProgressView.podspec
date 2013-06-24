Pod::Spec.new do |s|
  s.name         = "WNProgressView"
  s.version      = "1.0.1"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.summary      = "WNProgressView is a subclass of UIProgressView that shows a barber pole effect when progress is 0. Works on iOS 4.3+."
  s.homepage     = "https://github.com/n8chur/WNProgressView"
  s.author       = { 'Westin Newell' => 'wnewell87@gmail.com' }
  s.source       = { :git => 'https://github.com/n8chur/WNProgressView.git', :tag => '1.0.1' }
  s.source_files = 'WNProgressView.h', 'WNProgressView.m'
  s.platform     = :ios
end
