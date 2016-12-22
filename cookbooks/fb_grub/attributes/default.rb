# vim: syntax=ruby:expandtab:shiftwidth=2:softtabstop=2:tabstop=2
#
# Copyright (c) 2016-present, Facebook, Inc.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree. An additional grant
# of patent rights can be found in the PATENTS file in the same directory.
#

version = node.centos6? ? 1 : 2

default['fb_grub'] = {
  'terminal' => [
    'console',
  ],
  'serial' => {
    'unit' => 0,
    'speed' => 57600,
    'word' => 8,
    'parity' => 'no',
    'stop' => 1,
  },
  'timeout' => 5,
  'kernel_cmdline_args' => [],
  'kernels' => {},
  'saved_opts' => '',
  'tboot' => {
    'enable' => false,
    'kernel_extra_args' => [
      'intel_iommu=on',
      'noefi',
    ],
    'logging' => [
      'memory',
    ],
  },
  'version' => version,
  'use_labels' => false,
  'boot_disk' => 'hd0',
}
