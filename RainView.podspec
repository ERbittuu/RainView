Pod::Spec.new do |s|
  s.name             = 'RainView'
  s.version          = '1.0.0'
  s.summary          = 'Beautiful RainEffect🌨🌂🌧 with small piece of code.'

  s.homepage         = 'https://github.com/erbittuu/RainView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erbittuu' => 'erbittuu@gmail.com' }
  s.source           = { :git => 'https://github.com/erbittuu/RainView.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/erbittuu'

  s.ios.deployment_target = '8.0'
  s.source_files = 'RainView/Classes/**/*'
end
