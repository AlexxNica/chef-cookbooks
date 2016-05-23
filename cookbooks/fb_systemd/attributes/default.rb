# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

default['fb_systemd'] = {
  'default_target' => '/lib/systemd/system/multi-user.target',
  'modules' => [],
  'system' => {},
  'user' => {},
  'udevd' => {
    # no enable here as systemd-udevd cannot be disabled
    'config' => {},
    'hwdb' => {},
    'rules' => [],
  },
  'journald' => {
    # no enable here as systemd-journald cannot be disabled
    'config' => {
      'Storage' => 'auto',
    },
  },
  'logind' => {
    'enable' => true,
    'config' => {},
  },
  'networkd' => {
    'enable' => false,
  },
  'resolved' => {
    'enable' => false,
    'config' => {},
  },
  'timesyncd' => {
    'enable' => false,
    'config' => {},
  },
  'coredump' => {},
  'tmpfiles' => {
    '/dev/log' => {
      'type' => 'L+',
      'argument' => '/run/systemd/journal/dev-log',
    },
    '/dev/initctl' => {
      'type' => 'L+',
      'argument' => '/run/systemd/initctl/fifo',
    },
  },
  'preset' => {},
  'manage_systemd_packages' => true,
}
