#
# Be sure to run `pod lib lint SwiftNavigationProgressBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftNavigationProgressBar'
  s.version          = '1.0.2'
  s.summary          = 'Simple step by step progress bar for UINavigationController in Swift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
 Add a simple step by step progress bar under navigation bar that user knows how many page passed or how many page remaining to end of specific flow.
                       DESC

  s.homepage         = 'https://github.com/mohammadrezakhatibi/SwiftNavigationProgressBar'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'mohammadrezakhatibi' => 'mohammadrezakhatibi@outlook.com' }
  s.source           = { :git => 'https://github.com/mohammadrezakhatibi/SwiftNavigationProgressBar.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Sources/SwiftNavigationProgressBar/**/*'
  s.swift_versions = '5.0'
  # s.resource_bundles = {
  #   'SwiftNavigationProgressBar' => ['SwiftNavigationProgressBar/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
