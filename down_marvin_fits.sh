#!/bin/bash
# Author: LALALA 
# Target: Download the fits file that Marvin tools need.
# Reason: the api of Marvin website seemingly gets some trouble
# use a for loop to download fits files using wget.
################################################
### need to change these parameters: ###########
### plate_file,ifu_file,num_galaxy   ###########
################################################

# Path of the plate and ifu file
plate_file=/root/bash_file/manga_plate.dat
ifu_file=/root/bash_file/manga_ifu.dat

# Number of the galaxies
num_galaxy=4675

# Read the plate and ifu file
# Download the fits file using wget
for i in `seq 1 $num_galaxy`
do
	# load the file
	plate=`sed  -n ''$i'p' $plate_file`
	ifu=`sed  -n ''$i'p' $ifu_file`
	
	# download fits file from the sdss website
	wget  -nc --no-parent --reject="index.html*" --no-check-certificate https://dr15.sdss.org/sas/dr15/manga/spectro/analysis/v2_4_3/2.2.1/VOR10-GAU-MILESHC/$plate/$ifu/manga-$plate-$ifu-MAPS-VOR10-GAU-MILESHC.fits.gz
	
	# to see how the process is going
	let lalala=$num_galaxy-$i
	echo -e "have downloaded $i galaxies, $lalala remained\nsuccessfully download the galaxy ID:\n$plate-$ifu"
done

