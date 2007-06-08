#!/usr/bin/env ruby

require 'rubyxmltest'

def get_pipe(name)
    cap_file = File.dirname(__FILE__) + "/../testdata/#{name}.cap"
    command_line = '"C:/Program Files/Wireshark/tshark"' + " -r #{cap_file} -T pdml 2>&1"

    IO.popen(command_line)
end

def run_tests(test_class)
    run_test test_class, "normal_dump"
    run_test test_class, "huge_dump"
end

def run_test(test_class, data_file)
    pipe = get_pipe(data_file)
    puts pipe.readline
    instance = test_class.new(pipe)
    listener = PacketListener.new
    instance.add_observer(listener)

    start = Time.new
    instance.run
    finish = Time.new

    puts "#{test_class} ran against #{data_file} for #{finish - start}; got #{listener.notifications} packets"
end

class PacketListener
    def initialize
        @notifications = 0
    end

    def update(element)
        @notifications += 1 if element == "packet"
    end    

    def notifications
        @notifications
    end
end

run_tests(NullParser)
run_tests(ExpatParser)
run_tests(REXMLParser)
