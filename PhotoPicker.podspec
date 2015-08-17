Pod::Spec.new do |s|

  s.name         = "PhotoPicker"
  s.version      = "0.0.1"
  s.summary      = "PhotoPicker use PhotoKit and UIImagePickerController allowing for multiple asset selection"
  s.description  = <<-DESC
PhotoPicker use PhotoKit and UIImagePickerController allowing for multiple asset selection written in Swift.
                   DESC

  s.homepage     = "https://github.com/hirohisa/PhotoPicker"
  s.license      = { :type => "MIT", :file => "LICENSE" }

  s.author       = { "Hirohisa Kawasaki" => "hirohisa.kawasaki@gmail.com" }

  s.source       = { :git => "https://github.com/hirohisa/PhotoPicker.git", :tag => s.version }

  s.source_files = "PhotoPicker/*.{swift,xib}"
  s.requires_arc = true
  s.ios.deployment_target = '8.0'

end
