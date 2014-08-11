require "verdi/version"
require "verdi/runner"

module Verdi
  class GemNotFound < StandardError; end

  def self.usage
    <<-FIN.gsub /^( ){6}/, ""
      USAGE: verdi gem_name [version_x] [version_y]

        Outputs the diff between the provided gem versions.

      OPTIONS: 

        -h, --help      You're looking at it.

    FIN
  end
end
