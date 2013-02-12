#!/bin/bash

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    copyVm.sh is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
# Author: Carlo Cancellieri
# Date:   15 Mar 2012


# SRC_PATH (absolute or relative path to the VM)
#SRC_PATH="Ubuntu_folder_32Bit"
# SRC_NAME (name of the source VM)
#SRC_NAME="Ubuntu_name_32Bit"
SRC_PATH="$1"
SRC_NAME="$2"


# SRC_PATH (absolute or relative path for the destination VM)
#DEST_PATH="My_Ubuntu_folder_32Bit"
DEST_PATH="$3"
# SRC_NAME (name of the source VM)
#DEST_NAME="My_Ubuntu_name_32Bit"
DEST_NAME="$4"

#TODO checks for incoming arguments

mkdir -p $DEST_PATH

for i in `ls $SRC_PATH/$SRC_NAME*.*`;do
	cp -rp $i `echo "$i"|sed "s/$SRC_PATH\/*$SRC_NAME/$DEST_PATH\/$DEST_NAME/"`; 
done

for i in `ls $DEST_PATH/*.{vmsd,vmxf,vmx}`;do
	cat $i|sed "s/$SRC_NAME/$DEST_NAME/" > $i"_new"; mv -f $i"_new" $i;
done



