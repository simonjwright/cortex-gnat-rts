# Copyright (C) 2018-2024 Free Software Foundation, Inc.
#
# This file is part of the Cortex GNAT RTS package.
#
# The Cortex GNAT RTS package is free software; you can redistribute
# it and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation; either version
# 3 of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; see the file COPYING3.  If not, see
#  <http://www.gnu.org/licenses/>.

export ADL_BUILD=Debug
export ADL_BUILD_CHECKS=Disabled
export CALLGRAPHS=Disabled

all: circle.hex events.hex seconds.hex accelerometer.hex

circle events seconds accelerometer: rebuild.stamp
rebuild.stamp: force
	gprbuild -p -P tests
	touch $@
clean::
	gprclean -P tests
	rm -f rebuild.stamp

clean::
	-rm *~ *.ali *.o *.hex
	-rm -rf .build

%.hex: %
	arm-eabi-objcopy -O ihex $^ $@

.PHONY: all clean force
