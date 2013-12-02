require 'spec_helper'

describe Eccube::Plugin do
  it 'should have a version number' do
    Eccube::Plugin::VERSION.should_not be_nil
  end

  it 'should do something useful' do
    false.should be_true
  end
end
