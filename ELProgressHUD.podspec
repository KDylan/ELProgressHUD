Pod::Spec.new do |s|
    s.name             = 'ELProgressHUD'
    s.version          = '0.1.8'
    s.summary          = '封装自MBProgressHUD加载提示组件'
    #使用arc
    s.requires_arc = true
    s.homepage         = 'https://github.com/UEdge/ELProgressHUD'
    s.license          = { :type => 'Apache', :file => 'LICENSE' }
    s.author           = { 'Dylan.Kuang' => 'dylan.kuang@earlylight.com.hk' }
    s.source           = { :git => 'https://github.com/UEdge/ELProgressHUD.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '8.0'
    #设置swift试用版本
    s.swift_version = '4.0'
    # 上传file地址
    s.source_files = 'ELProgressHUD/Classes/*.{swift,h,m}'
 
    #资源文件地址
     #  s.resource_bundles = {
     #   'ELProgressHUD' => ['ELProgressHUD/Assets/Image.bundle']
     #  }
     
     s.resources = "ELProgressHUD/Assets/ELProgressHUD.bundle"

    s.dependency 'MBProgressHUD', '~> 1.1.0'

    s.pod_target_xcconfig = { 'SWIFT_SUPPRESS_WARNINGS' => 'YES' }
    
end
