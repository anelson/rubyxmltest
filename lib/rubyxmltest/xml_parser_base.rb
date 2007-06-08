#!/usr/bin/env ruby
require 'observer'

class XMLParserBase
    include Observable

    def initialize(pipe)
        @pipe = pipe
        @element_stack = []
    end

    def run
    end

    def start_element(element) 
        @element_stack.push(element)
    end

    def end_element()
        element = @element_stack.pop

        report_packet(element)
    end

    def report_packet(element)
        changed(true)
        notify_observers(element)
    end
end


