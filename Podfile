# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
    end
  end
end

target 'Traslator' do
  use_frameworks!

  pod 'SnapKit', '~> 5.7.1'
  pod 'Then', '~> 3.0.0'
  pod 'GoogleMLKit/Translate', '3.2.0'

end