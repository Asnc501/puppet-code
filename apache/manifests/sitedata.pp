class apache::sitedata {

  file { '/var/www/html/index.html':
    ensure => 'present',
    source => "puppet:///modules/apache/index.html",
    owner => 'apache',
    group => 'apacheadm',
  }
}
