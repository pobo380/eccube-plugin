require 'spec_helper'

describe Eccube::Plugin do
  it 'should have a version number' do
    Eccube::Plugin::VERSION.should_not be_nil
  end

  describe Eccube::Plugin::CLI do
    subject { Eccube::Plugin::CLI::Main.new }

    [:new, :hooks, :help, :deploy, :package].each do |key|
      it "should have a #{key} command" do
        expect(subject).to respond_to(key)
      end
    end

    describe Eccube::Plugin::CLI::Hooks do
      subject { Eccube::Plugin::CLI::Hooks.new }

      [:add, :list].each do |key|
        it "should have a #{key} command" do
          expect(subject).to respond_to(key)
        end
      end
    end
  end
end
