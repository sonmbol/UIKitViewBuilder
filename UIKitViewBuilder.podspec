Pod::Spec.new do |c|
  c.name             = 'UIKitViewBuilder'
  c.version          = '1.0.0'
  c.summary          = "SwiftUI framework to integrate UIView, UITableViewCell, and UICollectionViewCell components."
  c.homepage         = 'https://github.com/sonmbol/UIKitViewBuilder'
  c.license          = { :type => 'MIT', :file => 'LICENSE' }
  c.author           = { 'Ahmed Suliman' => 'dev.a7med95@gmail.com' }
  c.source           = { :git => 'https://github.com/sonmbol/UIKitViewBuilder.git', :tag => c.version.to_s }
  c.ios.deployment_target = '14.0'
  c.swift_version = '5.0'
  c.source_files = 'Sources/**/*'
  c.platform = :ios , '14.0'
  c.frameworks = 'UIKit'
end
