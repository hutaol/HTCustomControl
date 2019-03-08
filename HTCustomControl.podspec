Pod::Spec.new do |s|
    s.name         = 'HTCustomControl'
    s.version      = '0.0.1'
    s.summary      = 'A custom control'
    s.homepage     = 'https://github.com/hutaol/HTCustomControl'
    s.license      = 'MIT'
    s.authors      = {'hutaol' => '1325049637@qq.com'}
    s.platform     = :ios, '8.0'
    s.source       = {:git => 'https://github.com/hutaol/HTCustomControl.git', :tag => s.version}
    s.source_files = 'HTCustomControl/HTCustomControl/Classes/*.{h,m}'
    s.requires_arc = true
end