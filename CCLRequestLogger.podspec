Pod::Spec.new do |spec|
  spec.name = 'CCLRequestLogger'
  spec.version = '0.1.0'
  spec.homepage = 'https://cocode.org/'

  spec.requires_arc = true
  spec.osx.deployment_target = '10.7'
  spec.ios.deployment_target = '5.0'

  spec.subspec 'Manager' do |manager_spec|
    manager_spec.source_files = 'CCLRequestLogger/CCLRequestManager.{h,m}'
    manager_spec.dependency 'CCLRequestReplay'
  end

  spec.subspec 'Server' do |server_spec|
    server_spec.source_files = 'CCLRequestLogger/CCLRequestServer.{h,m}'
    server_spec.dependency 'CCLRequestLogger/Manager'
    server_spec.dependency 'CCLHTTPServer'
  end

  spec.subspec 'Viewer' do |viewer_spec|
    viewer_spec.source_files = 'CCLRequestLogger/CCLRequest*ViewController.{h,m}'
    viewer_spec.dependency 'CCLRequestLogger/Manager'
  end
end

