# encoding: utf-8
require "fluent-query/queries/abstract"

module FluentQuery
    module Queries
    
         ##
         # Compiled query.
         #
         
         class Compiled < FluentQuery::Queries::Abstract
            
            ##
            # Holds query in compiled form.
            #
            
            @raw
            attr_accessor :raw

            ##
            # Constructor.
            #

            public
            def initialize(connection, query)
                super(connection)
                @raw = query.processor.compile(@connection.driver.build_query(query, :compile))
            end
            
            ##
            # Builds prepared query string to final form.
            #
            
            public
            def build(*args)
                @raw.complete(*args)
            end
            
            ##
            # Returns all selected rows ordered according to datafield from it.
            #

            public
            def assoc(specification, *args)
                self.execute(*args).assoc(specification)
            end
            
        end
    end
end

