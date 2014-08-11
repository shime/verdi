module Verdi
  class Runner
    def initialize(command)
      @gem_name, *@versions = command
      @platform = Gem.platforms.last

      @versions ||= [Gem.requirement.default]
    end

    def execute
      @versions.each do |version|
        fetch version
      end
    end

    def fetch(version)
      dep = Gem::Dependency.new @gem_name, version

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
  end
end
