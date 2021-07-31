class helloworld {

  file { '/opt/helloworld.txt':
    ensure => 'present',
    owner => 'ubuntu',
    group => 'ubuntu',
    mode => '0755',
    content => 'This is a sample file by puppet\n',
  }

  group { 'jenkinsadm':
    ensure => 'present',
    gid => '2000',
  }
  user { 'jenkins':
    ensure => 'present',
    uid => '2000',
    gid => '2000',
    shell =>'/bin/bash',
    home => '/home/jenkins',
  }

  package { 'unzip':
    ensure => 'installed',
  }

  cron { 'log-rotation':
    user => 'root',
    command => '/opt/helloworld.sh',
    hour => '*',
    minute => '*/15',
    weekday => ['saturday', 'sunday'],
  }

  exec { 'say-hello':
    command => '/bin/echo "Welcome to custom command" > /opt/custom.txt',
    user => 'root',
    creates => '/opt/custom.txt',
  }

  service { 'cron':
    ensure => 'running',
    enable => true,
  }

  file { '/opt/samplecode':
    ensure => 'directory',
    mode => '0644',
  }

}

