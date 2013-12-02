require "eccube/plugin/version"
require "thor"

module Eccube
  module Plugin
    module CLI
      class Hooks < Thor
        desc 'add [target]', 'generate hook class file'
        def add(target)
        end

        desc 'list', 'print list of hookable classes'
        def list(target)
        end
      end

      class Main < Thor
        desc 'new [plugin_code]', 'create a new plugin from skeleton'
        def new(plugin_code)
        end

        desc 'deploy [host]', 'deploy plugin to target host'
        def deploy(host=:all)
        end

        desc 'package [filepath]', 'package plugin to PLUGINCODE.tar.gz'
        def package(filepath=nil)
        end

        register Hooks, 'hooks', 'hooks [COMMAND]', 'commands related to EC-CUBE hook points'
      end
    end
  end
end
