source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

use_frameworks!
inhibit_all_warnings!

pod 'Family'
pod 'Blueprints'
pod 'R.swift', '~> 4.0', configurations: 'Debug'
pod 'SwiftLint', configurations: 'Debug'

target 'SwiftProject Staging'
target 'SwiftProject Production'

target 'SwiftProject Tests' do
  inherit! :search_paths
end
