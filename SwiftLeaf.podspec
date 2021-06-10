#
# Be sure to run `pod lib lint SwiftLeaf.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftLeaf'
  s.version          = '0.1.0'
  s.summary          = 'Some extensions for class, and tools'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Some extensions for string/array/UIKit, let us use easily.
Some tools which can help us code quickly, eg. WaterfallLayout.
                       DESC

  s.homepage         = 'https://github.com/wanqingrongruo/SwiftLeaf'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wanqingrongruo' => 'zwxwqrr@gmail.com' }
  s.source           = { :git => 'https://github.com/wanqingrongruo/SwiftLeaf.git', :tag => s.version.to_s }
  s.social_media_url = 'https://www.yuque.com/u53201'

  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'
  s.source_files = 'SwiftLeaf/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SwiftLeaf' => ['SwiftLeaf/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
