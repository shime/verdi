require 'rubygems'
require 'rubygems/package'

module Verdi
  class Runner
    def initialize(command)
      @gem_name, *@versions = command
      @platform = Gem.platforms.last

      @versions ||= [Gem.requirement.default]
      @names_and_versions = @versions.map {|version| "#{@gem_name}-#{version}"}
    end

    def execute
      package_paths = @names_and_versions.map do |name_with_version|
        path = fetch name_with_version
        extract path, name_with_version
        path
      end
      
      command = "git diff --color-words --no-index "+
                "#{@names_and_versions.reverse.join(" ")}"
      system(command)
      FileUtils.rm_rf(package_paths + @names_and_versions)
    end

    def fetch(name_with_version)
      dep = Gem::Dependency.new *name_with_version.split("-")

      specs_and_sources, errors =
        Gem::SpecFetcher.fetcher.spec_for_dependency dep

      if @platform then
        filtered = specs_and_sources.select { |s,| s.platform == @platform }
        specs_and_sources = filtered unless filtered.empty?
      end

      spec, source = specs_and_sources.max_by { |s,| s.version }

      if spec.nil? then
        raise GemNotFound
      end

      source.download spec
    end

    def extract(path, name_with_version)
      package = Gem::Package.new(path)
      package.extract_files name_with_version
    end
  end
end
