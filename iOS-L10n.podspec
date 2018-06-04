
Pod::Spec.new do |s|
  s.name             = 'iOS-L10n'
  s.version          = '0.2.0'
  s.summary          = 'A simple way to localize iOS apps'

  s.description      = <<-DESC
A simple way to localize iOS apps. Allow localize Storyboard and source code
                       DESC

  s.homepage         = 'https://github.com/dmanuelcl/ios-l10n'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Dani Manuel Céspedes Lara' => 'dmanuelcl@gmail.com' }
  s.source           = { :git => 'https://github.com/dmanuelcl/ios-l10n.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'L10n/Classes/**/*'
end
