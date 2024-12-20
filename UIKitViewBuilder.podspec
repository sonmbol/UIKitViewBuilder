Pod::Spec.new do |c|
  c.name             = 'UIKitViewBuilder'
  c.version          = '1.0.2'
  c.summary          = "SwiftUI framework to integrate UIView, UITableViewCell, and UICollectionViewCell components."
  c.homepage         = 'https://github.com/sonmbol/UIKitViewBuilder'
  c.license          = 'MIT'
  c.author           = { 'Ahmed Suliman' => 'dev.a7med95@gmail.com' }
  c.source           = { :git => 'https://github.com/sonmbol/UIKitViewBuilder.git', :tag => c.version.to_s }
  c.ios.deployment_target = '14.0'
  c.swift_version = ['5.0']
  c.source_files = 'Sources/**/*'
  c.frameworks = "UIKit", "SwiftUI"
  c.cocoapods_version = '>= 1.13.0'
end
