#!/usr/bin/env ruby

require 'fileutils'

def prompt(message)
  print "#{message} > "
  input = gets.chomp
  input.strip.empty? ? prompt(message) : input
end

folder_path = __dir__

# Input
repo_name = prompt('GitHub repository name')
bundle_domain = prompt('Client bundle domain')
project_name = prompt('Project name')
urn_scheme = project_name.downcase.delete(' ')

# Configs
file_names = Dir["#{folder_path}/**/*.*"]
file_names.push(".swiftlint.yml")
file_names.push(".travis.yml")
file_names.push("Podfile")

# Fatlane
file_names.push("fastlane/Appfile")
file_names.push("fastlane/Deliverfile")
file_names.push("fastlane/Fastfile")

# Project
file_names.push("SwiftProject.xcodeproj/project.pbxproj")
file_names.push("SwiftProject.xcodeproj/project.xcworkspace/contents.xcworkspacedata")
file_names.push("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Staging.xcscheme")
file_names.push("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Pre-Production.xcscheme")
file_names.push("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Production.xcscheme")
file_names.push("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Tests.xcscheme")

# Search and replace
file_names.each do |file_name|
  ignored_file_types = [
    '.xccheckout',
    '.xcodeproj',
    '.xcworkspace',
    '.xcuserdatad',
    '.xcuserstate',
    '.xcassets',
    '.appiconset',
    '.png',
    '.lproj',
    '.rb',
    '.framework',
    '.playground'
  ]

  if !ignored_file_types.include?(File.extname(file_name))
    text = File.read(file_name)

    new_contents = text.gsub(/<REPONAME>/, repo_name)
    new_contents = new_contents.gsub(/SwiftProject/, project_name)
    new_contents = new_contents.gsub(/BundleDomain/, bundle_domain)
    new_contents = new_contents.gsub(/BundleDomain/, bundle_domain)
    new_contents = new_contents.gsub(/compassurnscheme/, urn_scheme)

    File.open(file_name, "w") {|file| file.puts new_contents }
  end
end

# Rename files
FileUtils.rm('README.md')
File.rename('SwiftProject-README.md', 'README.md')
File.rename("SwiftProject", "#{project_name}")
File.rename("SwiftProjectTests", "#{project_name}Tests")

File.rename("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Staging.xcscheme",
  "SwiftProject.xcodeproj/xcshareddata/xcschemes/#{project_name} Staging.xcscheme")

File.rename("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Pre-Production.xcscheme",
  "SwiftProject.xcodeproj/xcshareddata/xcschemes/#{project_name} Pre-Production.xcscheme")

File.rename("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Production.xcscheme",
  "SwiftProject.xcodeproj/xcshareddata/xcschemes/#{project_name} Production.xcscheme")

File.rename("SwiftProject.xcodeproj/xcshareddata/xcschemes/SwiftProject Tests.xcscheme",
  "SwiftProject.xcodeproj/xcshareddata/xcschemes/#{project_name} Tests.xcscheme")

File.rename("SwiftProject.xcodeproj", "#{project_name}.xcodeproj")

FileUtils.rm_rf ".git"
FileUtils.rm('init.rb')

# Setup project
system("pod install")
system("git init && git add . && git commit -am 'Initial commit'")
system("git remote add origin https://github.com/hyperoslo/#{repo_name}.git")
system("open \"#{project_name}.xcodeproj\"")
