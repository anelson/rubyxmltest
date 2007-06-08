#!/usr/bin/env ruby
require 'xml/parser'

require "rubyxmltest"

class ExpatParserThunk < XML::Parser
  def expat_parser(parser)
      @expat_parser = parser
  end

  def startElement(name, attr)
      @expat_parser.start_element(name)
  end

  def endElement(name)
      @expat_parser.end_element()
  end 
end

class ExpatParser < XMLParserBase
    def initialize(pipe)
        super(pipe)
    end

    def run
        parser = ExpatParserThunk.new()
        parser.expat_parser(self)
        parser.parse(@pipe)
    end
end
