#
# Be sure to run `pod lib lint lbelvale2016.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'lbelvale2016'
  s.version          = '0.1.0'
  s.summary          = 'Piscine-IOS D08'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Piscine-IOS D08 create and save articles using CoreData
create by lbelvale 42 student.
                       DESC

  s.homepage         = 'https://github.com/lbelvale42/lbelvale2016'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lbelvalle' => 'lbelvale@student.42.fr' }
  s.source           = { :git => 'https://github.com/<GITHUB_USERNAME>/lbelvale2016.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'lbelvale2016/Classes/Article.swift','lbelvale2016/Classes/ArticleManager.swift', 'lbelvale2016/Classes/article.xcdatamodeld'
  
  # s.resource_bundles = {
  #   'lbelvale2016' => ['lbelvale2016/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'CoreData'
  # s.dependency 'AFNetworking', '~> 2.3'
end
