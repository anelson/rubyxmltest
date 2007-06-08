#!/usr/bin/env ruby
require "rubyxmltest"

class NullParser < XMLParserBase
    def initialize(pipe)
        super(pipe)
    end

    def run
        @pipe.each do |line|
        end
    end
end
