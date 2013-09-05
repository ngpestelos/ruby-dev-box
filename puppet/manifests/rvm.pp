include rvm

if $rvm_installed == "true" {
  rvm_system_ruby { 'ruby-1.9.3-p448':
    ensure => 'present',
    default_use => true;
  }

  rvm_gem {
    'ruby-1.9.3-p448@global/puppet':
    ensure => 'present',
    require => Rvm_system_ruby['ruby-1.9.3-p448'];

    'ruby-1.9.3-p448@global/bundler':
    ensure => 'present',
    require => Rvm_system_ruby['ruby-1.9.3-p448'];

    'ruby-1.9.3-p448@global/chef':
    ensure => 'present',
    require => Rvm_system_ruby['ruby-1.9.3-p448'];
  }
}
