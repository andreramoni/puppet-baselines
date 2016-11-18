require 'spec_helper'
describe 'rbaselines' do

  context 'with defaults for all parameters' do
    it { should contain_class('rbaselines') }
  end
end
