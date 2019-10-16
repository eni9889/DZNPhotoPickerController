@version = "1.6.6"

Pod::Spec.new do |s|
  s.name         	  = "DZNPhotoPickerController"
  s.version      	  = @version
  s.summary      	  = "A photo search/picker for iOS using popular providers like 500px, Flickr, Intagram, Google Images, etc."
  s.description  	  = "This framework tries to mimic as close as possible the native UIImagePickerController API for iOS7, in terms of features, appearance and behaviour."
  s.homepage   		  = "https://github.com/dzenbot/DZNPhotoPickerController"
  s.screenshots 	  = "https://raw.githubusercontent.com/dzenbot/DZNPhotoPickerController/master/Docs/screenshots.png"
  s.license     	  = { :type => 'MIT', :file => 'LICENSE' }
  s.author       	  = { "Ignacio Romero Z." => "iromero@dzen.cl" }
  
  s.source       	  = { :git => "https://github.com/dzenbot/UIPhotoPickerController.git", :tag => "v#{s.version}" }

  s.default_subspec = 'Core'
  s.resources       = 'Resources', 'Source/Resources/**/*.*'
  s.requires_arc 	  = true
  s.platform        = :ios, '7.0'

  s.public_header_files = 'Source/Classes/*/*.h'

  s.subspec 'Core' do |ss|
    ss.source_files = 'Source/Classes/Core/*.{h,m}'
    ss.dependency   'SDWebImage'
    ss.dependency   'DZNEmptyDataSet'
    ss.dependency   'MBProgressHUD'

    ss.dependency   'DZNPhotoPickerController/Services'
    ss.dependency   'DZNPhotoPickerController/Editor'
  end

  s.subspec 'Services' do |ss|
    ss.source_files = 'Source/Classes/Services/*.{h,m}',
                      'Source/Classes/Core/DZNPhotoPickerControllerConstants.{h,m}'

    ss.dependency 'AFNetworking/NSURLConnection', "~> 2.0"
    ss.dependency 'AFNetworking/NSURLSession', "~> 2.0"

    ss.prefix_header_contents = '#import <MobileCoreServices/MobileCoreServices.h>',
                                '#import <SystemConfiguration/SystemConfiguration.h>'
  end

  s.subspec 'Editor' do |ss|
    ss.source_files = 'Source/Classes/Editor/*.{h,m}',
                      'Source/Classes/Core/DZNPhotoPickerControllerConstants.{h,m}'
  end
  
end
