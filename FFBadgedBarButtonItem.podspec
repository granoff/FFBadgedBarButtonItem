Pod::Spec.new do |s|
  s.name     = 'FFBadgedBarButtonItem'
  s.version  = '2.0.0'
  s.license  = 'MIT'
  s.summary  = 'FFBadgedBarButtonItem is a UIBarButtonItem subclass that supports badging.'

  s.homepage = 'https://github.com/granoff/FFBadgedBarButtonItem'
  s.author   = { 'Mark H. Granoff' => 'mark@granoff.net' }

  s.source   = { :git => 'https://github.com/granoff/FFBadgedBarButtonItem.git', :tag => '2.0.0' }

  s.platform = :ios
  s.source_files = 'Sources/FFBadgedBarButtonItem/FFBadgedBarButtonItem.swift'
  s.swift_version = '6.0'
  s.ios.deployment_target = '15.0'
end
