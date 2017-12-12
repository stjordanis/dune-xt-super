#!/bin/bash
#
# This file is part of the dune-community/Dockerfiles project:
#   https://github.com/dune-community/Dockerfiles
# Copyright 2017 dune-community/Dockerfiles developers and contributors. All rights reserved.
# License: Dual licensed as BSD 2-Clause License (http://opensource.org/licenses/BSD-2-Clause)
#      or  GPL-2.0+ (http://opensource.org/licenses/gpl-license)
# Authors:
#   Felix Schindler (2017)
#   Rene Milk       (2017)

source /usr/share/env.sh

USERNAME_=${LOCAL_USER:-user}
UID_=${LOCAL_UID:-1000}
GID_=${LOCAL_GID:-$UID_}

groupadd -g $GID_ $USERNAME_ &> /dev/null
if [ -e /home/$USERNAME_ ] ; then
  useradd -d /home/$USERNAME_ -g 0 -s /bin/bash -u $UID_ $USERNAME_
else
  useradd -md /home/$USERNAME_ -g 0 -s /bin/bash -u $UID_ $USERNAME_
fi

chown -R $USERNAME_:$GID_ /home/$USERNAME_
chown -R $USERNAME_:$GID_ /root

echo "$USERNAME_ ALL=(ALL) NOPASSWD:/usr/bin/apt-get" >> /etc/sudoers
echo "$USERNAME_ ALL=(ALL) NOPASSWD:/usr/bin/apt" >> /etc/sudoers

export LANG=en_US.UTF-8

if [ "X$@" == "X" ]; then
  exec gosu $USERNAME_ /usr/local/bin/run_tests.bash
else
  exec gosu $USERNAME_ "$@"
fi

