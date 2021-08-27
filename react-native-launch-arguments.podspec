require "json"

package = JSON.parse(File.read(File.join(__dir__, "package.json")))

Pod::Spec.new do |s|
  s.name         = "react-native-launch-arguments"
  s.version      = package["version"]
  s.summary      = package["description"]
  s.homepage     = package["repository"]["baseUrl"]
  s.license      = { :type => package["license"], :file => "LICENSE" }
  s.authors      = { package["author"]["name"] => package["author"]["email"] }
  s.ios.deployment_target = '9.0'
  s.tvos.deployment_target = '9.0'
  s.osx.deployment_target = '10.13'
  s.source       = { :git => "#{package["repository"]["baseUrl"]}.git", :tag => "#{s.version}" }

  s.source_files = "ios/**/*.{h,m,swift}"
  s.requires_arc = true

  s.dependency "React"
end
