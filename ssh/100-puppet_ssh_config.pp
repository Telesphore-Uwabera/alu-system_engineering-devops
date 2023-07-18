#!/usr/bin/env bash
#gdcy
file { '/root/.ssh/config':
  ensure => 'present',
  mode   => '0600',
  owner  => 'root',
  group  => 'root',
  content => "
Host *
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
"
}
