Pod::Spec.new do |s|
    s.name             = "mParticle-Localytics"
    s.version          = "6.8.0"
    s.summary          = "Localytics integration for mParticle"

    s.description      = <<-DESC
                       This is the Localytics integration for mParticle.
                       DESC

    s.homepage         = "https://www.mparticle.com"
    s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
    s.author           = { "mParticle" => "support@mparticle.com" }
    s.source           = { :git => "https://github.com/mparticle-integrations/mparticle-apple-integration-localytics.git", :tag => s.version.to_s }
    s.social_media_url = "https://twitter.com/mparticles"
    s.default_subspec  = "DefaultVersion"

    def s.subspec_common(ss)
        ss.ios.deployment_target = "8.0"
        ss.ios.source_files      = 'mParticle-Localytics/*.{h,m,mm}'
        ss.ios.dependency 'mParticle-Apple-SDK/mParticle', '~> 6.7'
        ss.frameworks = 'SystemConfiguration', 'CoreLocation', 'AdSupport'
        ss.library = 'z', 'sqlite3'

        ss.ios.pod_target_xcconfig = {
            'LIBRARY_SEARCH_PATHS' => '$(inherited) $(PODS_ROOT)/Localytics/**',
        }
        ss.ios.user_target_xcconfig = { 'OTHER_LDFLAGS' => '$(inherited) -framework "CoreLocation"' }
    end

    s.subspec 'DefaultVersion' do |ss|
        ss.ios.dependency 'Localytics', '4.1.0'
        s.subspec_common(ss)
    end

    s.subspec 'UserDefinedVersion' do |ss|
        ss.ios.dependency 'Localytics'
        s.subspec_common(ss)
    end
end
