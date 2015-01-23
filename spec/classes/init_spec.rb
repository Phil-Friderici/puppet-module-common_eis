require 'spec_helper'
  modules = {
    'afs'            => { :module => 'afs', },
    'beuser'         => { :module => 'beuser', },
    'logaggregation' => { :module => 'logaggregation', },
    'nscd'           => { :module => 'nscd', },
    'vas'            => { :module => 'vas', },
# no test possible because repository is not public
#    'autofs'         => { :module => 'eis_autofs', },
#    'customrepo'     => { :module => 'customrepo', },
#    'nrpe'           => { :module => 'eis_nrpe', },
#    'sudo'           => { :module => 'eis_sudo', },
  }

describe 'common_eis' do
  context 'with default values for all parameters' do
    it { should compile.with_all_deps }
    it { should contain_class('common_eis') }
  end

  let :facts do
    {
      :osfamily          => 'RedHat',
      :lsbmajdistrelease => '6',
      :kernel            => 'Linux',
    }
  end

  modules.sort.each do |k,v|
    describe "with <enable_#{k}> set to" do
      ['true',true].each do |value|
        context "valid value <#{value}>" do
          let :params do
            {
              :"enable_#{k}" => value,
            }
          end

          it { should compile.with_all_deps }
          it { should contain_class('common_eis') }
          it { should contain_class(v[:module]) }
        end
      end

# '-1' doesn't fail, validation needs to be fixed
#      [ 'yess', 'nooo', 'maybe', '-1' ].each do |value|
      [ 'yess', 'nooo', 'maybe', ].each do |value|
        context "invalid value <#{value}>" do
          let :params do
            {
              :"enable_#{k}" => value,
            }
          end

          it 'should fail' do
            expect {
              should contain_class('common_eis')
            }.to raise_error(Puppet::Error, /^str2bool\(\): Unknown type of boolean given at/)
          end
        end
      end

    end
  end

end
