#!/usr/bin/env ruby
require 'rexml/document'
require 'rexml/element'

require "rubyxmltest"

class REXMLParser < XMLParserBase
    def initialize(pipe)
        super(pipe)
    end

    def run
        REXML::Document.parse_stream(@pipe, self)
    end


    # StreamListener impl begins here

    # Called when a tag is encountered.
    def tag_start(name, attrs)
        start_element(name)
    end

    # Called when the end tag is reached.  In the case of <tag/>, tag_end
    # will be called immidiately after tag_start
    def tag_end(name)
        end_element
    end

    # Called when text is encountered in the document
    # @p text the text content.
    def text(text)
    end

    # Called when an instruction is encountered.  EG: <?xsl sheet='foo'?>
    def instruction(name, instruction)
    end

    # Called when a comment is encountered.
    def comment(comment)
    end

    # Handles a doctype declaration. 
    def doctype(name, pub_sys, long_name, uri)
        # Don't care about doctypes
    end

    # Called when the doctype is done
    def doctype_end
        # Don't care about doctypes
    end

    def attlistdecl element_name, attributes, raw_content
    end

    # <!ELEMENT ...>
    def elementdecl content
        # Don't care
    end

    def entitydecl content
        # Don't care
    end

    # <!NOTATION ...>
    def notationdecl content
        # Don't care
    end

    # Called when %foo; is encountered in a doctype declaration.
    def entity content
        # Don't care
    end

    # Called when <![CDATA[ ... ]]> is encountered in a document.
    def cdata(content)
    end

    # Called when an XML PI is encountered in the document.
    # EG: <?xml version="1.0" encoding="utf"?>
    def xmldecl(version, encoding, standalone)
    end
end
