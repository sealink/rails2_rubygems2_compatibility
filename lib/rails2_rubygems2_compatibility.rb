module Rails2Rubygems2Compatibility
  VERSION = '0.0.1'
end

# monkey patch. Will ignore vendor gems.
# Sources:
# http://djellemah.com/blog/2013/02/27/rails-23-with-ruby-20/
# http://stackoverflow.com/questions/15349869/undefined-method-source-index-for-gemmodule-nomethoderror
if Gem::VERSION >= '2.0.0'
  module Gem
    def self.source_index
      sources
    end

    def self.cache
      sources
    end

    SourceIndex = Specification

    class SourceList
      # If you want vendor gems, this is where to start writing code.
      def search( *args ); []; end
      def each( &block ); end
      include Enumerable
    end
  end
end
