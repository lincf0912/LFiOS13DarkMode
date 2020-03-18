Pod::Spec.new do |s|
s.name         = 'LFiOS13DarkMode'
s.version      = '1.0.1'
s.summary      = 'easy adaptation to iOS13 dark mode'
s.homepage     = 'https://github.com/lincf0912/LFiOS13DarkMode'
s.license      = 'MIT'
s.author       = { 'lincf0912' => 'dayflyking@163.com' }
s.platform     = :ios
s.ios.deployment_target = '7.0'
s.source       = { :git => 'https://github.com/lincf0912/LFiOS13DarkMode.git', :tag => s.version, :submodules => true }
s.requires_arc = true
s.default_subspec = 'Core'

s.subspec 'Core' do |ss|
ss.source_files = 'LFiOS13DarkMode/class/*.{h,m}','LFiOS13DarkMode/class/**/*.{h,m}'
ss.public_header_files = 'LFiOS13DarkMode/class/LFiOS13DarkModeHeader.h','LFiOS13DarkMode/class/UIImage/*.h','LFiOS13DarkMode/class/UIView/*.h','LFiOS13DarkMode/class/CALayer/*.h','LFiOS13DarkMode/class/UIColor/*.h'
end

end
