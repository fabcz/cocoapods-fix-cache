module Pod
    module Downloader
        class Cache
            alias_method :old_ensure_matching_version, :ensure_matching_version
            def ensure_matching_version
                # Fix Concurrent building occasionally cleans the Pods cache directory #11826 #11827
                # https://github.com/CocoaPods/CocoaPods/pull/11827
                if Cache.respond_to?(:read_lock) && Cache.respond_to?(:write_lock)
                    version_file = root + "VERSION"
                    version = nil
                    Cache.read_lock(version_file) { version = version_file.read.strip if version_file.file? }

                    root.rmtree if version != Pod::VERSION && root.exist?
                    root.mkpath

                    Cache.write_lock(version_file) { version_file.open("w") { |f| f << Pod::VERSION } }
                else
                    old_ensure_matching_version
                end
            end
        end
    end
end
