class apache::prerequisite {
  group { 'apacheadm':
    ensure => 'present',
    gid => '2001',
  }
  user { 'apache':
    ensure => 'present',
    uid => '2001',
    gid => '2001',
    shell =>'/bin/bash',
    home => '/home/apache',
  }

  file { '/opt/apache_logs':
    ensure => 'directory',
    owner => 'apache',
    group => 'apacheadm',
    mode => '0755',
  }

}

