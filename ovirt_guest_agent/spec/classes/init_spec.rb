require 'spec_helper'
describe 'ovirt_guest_agent' do

  context 'with defaults for all parameters' do
    it { should contain_class('ovirt_guest_agent') }
  end
end
