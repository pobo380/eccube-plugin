require "eccube/plugin/version"
require "eccube/plugin/license"
require "yaml"
require "date"
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
        include Thor::Actions

        class << self
          def source_root
            File.expand_path(File.dirname(__FILE__))
          end
        end

        attr_accessor :plugin_code

        desc 'new [plugin_code]', 'generate a new plugin from skeleton'
        def new(plugin_code)
          self.plugin_code = plugin_code

          ## Input plugin informations.
          plugin_info = { :plugin_code => plugin_code, :year => Date.today.year }

          say set_color('Generate a new plugin from skeleton.', :cyan)
          plugin_info[:author] = ask 'Input author: '

          licenses_table = License::Licenses.map.with_index {|license, idx| [idx, license[:name]]}
          say set_color('Choose your software license. Reference: http://opensource.org/licenses', :cyan)
          begin
            print_table licenses_table
            license_idx = ask('> ').to_i

            plugin_info[:license]     = License::Licenses[license_idx][:name]
            plugin_info[:license_url] = License::Licenses[license_idx][:url]
          rescue
            say set_color('Invalid number. Choose your software license.', :red)
            retry
          end

          ## Generate plugin directory and .eccube-plugin.yml
          begin
            raise Errno::EEXIST if File.exists?(File.join(Dir.pwd, plugin_code))

            directory('templates', plugin_code, plugin_info)

            say set_color("Initialization Complete!", :green)
          rescue Errno::EEXIST => e
            say set_color("Failed: '#{plugin_code}' directory already exists.", :red)
          end
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
