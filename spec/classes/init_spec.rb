require 'spec_helper'

describe 'common_eis' do

  describe 'class common_eid' do

    context 'default options' do
      it { should contain_class('common_eis') }
    end
  end
end
