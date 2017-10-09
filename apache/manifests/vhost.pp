# == Define: apache::vhost
#
define apache::vhost ($port, $docroot, $ssl=true, $template='apache/vhost.conf.erb', $priority, $serveraliases='') {

      include apache
      file { ["/etc/httpd/sites-enabled", "/etc/httpd/sites-available"]:
        ensure => directory,
        mode => '0775',
      }

      file { '/etc/httpd/sites-enabled/${priority}-${name}':
        ensure => file,
        mode => '777',
        content => template ($template),
        owner => "root",
        group => "root",
        require => [File["/etc/httpd/sites-enabled"],Class["apache::install"]],
        notify => Class["apache::service"],
      }
    }
