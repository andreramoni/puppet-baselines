require 'spec_helper'
describe 'baselines' do

  context 'with defaults for all parameters' do
    it { should contain_class('baselines') }
  end
end
