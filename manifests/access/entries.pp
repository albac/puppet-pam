# == Class: pam::access::entries
#
# This class is a class wrapper around pam::access::entry
# It makes it easier to standardize input format when build
# resources from hiera, as data can be declared using a
# centrally managed entry point and without explicitly
# calling hiera_hash() in site modules.
# 
# === Parameters
#
# [*parameters*]
#   PAM access entries formated as a hash (pam::access::entry)
#   Valid values: see pam::access::entry
#
# === Sample Usage
#
# * Does nothing
#   class { 'pam::access::entries': }
#
# * Adds access to Domain Admins group
#   class { 'pam::access::entries':
#     parameters => {
#       'allow_domain_users_group' => {
#         ensure      => present,
#         object      => 'Domain Admins',
#         object_type => 'group',
#         permission  => 'allow',
#         origins     => 'ALL',
#       }
#     }
#   }
#
# * Within matching hiera yaml file you could add:
# pam::access::entries:
#   'allow_domain_users_group':
#     ensure: present
#     object: 'Domain Admins'
#     object_type: 'group'
#     permission: 'allow'
#     origins: 'ALL'
#
# === Supported platforms
#
# This module has been tested on the following platforms
# * Ubuntu LTS 10.04
#
# To add support for other platforms, edit the params.pp file and provide
# settings for that platform.
#
# === Author
#
# Johan Lyheden <johan.lyheden@artificial-solutions.com>
#
class pam::access::entries ( $parameters = {} ) inherits pam::params {

  include pam

  create_resources('pam::access::entry',$parameters)

}