require 'thor'

module Sked
  class CLI < Thor
    desc "scaffold", "Generates a new worker to be created"
    def scaffold(name)
      Sked::Scaffold.new(name).generate
    end

    desc 'destroy', "Removes said  worker from your project"
    def destroy(name)
      Sked::Scaffold.new(name).destroy
    end
  end
end
