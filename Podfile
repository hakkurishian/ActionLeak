# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ActionLeak' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ActionLeak
  pod 'RxSwift'
  pod 'Action'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if target.name.split('-').first == "RxSwift"
      target.build_configurations.each do |config|
        if config.name == 'Debug'
          config.build_settings['OTHER_SWIFT_FLAGS'] ||= ['-D', 'TRACE_RESOURCES']
        end
      end
    end
  end
end


