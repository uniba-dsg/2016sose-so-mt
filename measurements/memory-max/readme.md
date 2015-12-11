Memory Measurement
==================

what we measure exactly
-----------------------




Set up
------------

The docker memory measurement is based on linux cgroups, so you have to enable a kernel command line argument to enable the measuremnt of memory consumption of cgroups.


E.g. Ubunutu 14.04

- open grub:   `gedit /etc/default/grub`
- change line: `GRUB_CMDLINE_LINUX_DEFAULT="quiet splash cgroup_enable=memory swapaccount=1"`
- update grub: `update-grub`
- restart ubuntu
