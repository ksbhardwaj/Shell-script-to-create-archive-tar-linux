# !/bin/bash
# Ketan Sharma
shell_options=()
tLen=${#shell_options[@]}
for i in $*
do
	shell_options+=($i)
done
extensions=()
# get length of an array
tLen=${#shell_options[@]}
# use for loop read all nameservers
for (( i=0; i<${tLen}; i++ ));
do 
  if [ ${shell_options[$i]} == "-s" ]; then
     i=$(($i+1))
     size=${shell_options[$i]} 
  else 
      if [ ${shell_options[$i]} == "-d" ]; then
       i=$(($i+1))
       destination_dir=${shell_options[$i]}      
      else 
       if [ ${shell_options[$i]} == "-t" ]; then
        i=$(($i+1))
        target_dir=${shell_options[$i]} 
       else 
         extensions+=(${shell_options[$i]})
       fi
      fi
  fi  
done
 if [[ $size != "" && $destination_dir != "" && $target_dir != "" && $extensions != "" ]]; then #if extension_list, size, destination and target is given
	cd $destination_dir
	echo "-------------------------------------------------------------"
	echo "Files with given extensions" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	s1=${#extensions[$i]}
  	if [ $s1 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir $target_dir/myArchive
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s1=${#extensions[$i]}
  		if [ $s1 -gt 1 ]; then
			for file in `ls *.${extensions[$i]}`; do			
			size_wc=$(wc -c < $file | tr -d ' ')
			if [ $size_wc -ge $s1 ];then		
			cp $file $target_dir/myArchive	
			fi
			done
			fi	
		done
	cd $target_dir
	tar -cvf myArchive.tar -C $target_dir/myArchive .
	rm -rf $target_dir/myArchive	
 elif [[ $size != "" && $destination_dir != "" && $extensions != "" && $target_dir == "" ]]; then #if extnsion_list, size and destination is given
 cd $destination_dir
	echo "-------------------------------------------------------------"
	echo "Files with given extensions" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	s2=${#extensions[$i]}
  	if [ $s2 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir $destination_dir/myArchive
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s2=${#extensions[$i]}
  		if [ $s2 -gt 1 ]; then
			for file in `ls *.${extensions[$i]}`; do			
			size_wc=$(wc -c < $file | tr -d ' ')
			if [ $size_wc -ge $s2 ];then		
			cp $file $destination_dir/myArchive	
			fi
			done
			fi	
		done
	cd $destination_dir
	tar -cvf myArchive.tar -C $destination_dir/myArchive .
	rm -rf $destination_dir/myArchive	
 elif [[ $size != "" && $target_dir != "" && $extensions != "" && $destination_dir == "" ]]; then #if extnsion_list, size and target is given
	echo "-------------------------------------------------------------"
	echo "Files with given extensions" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	s6=${#extensions[$i]}
  	if [ $s6 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir $target_dir/myArchive
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s1=${#extensions[$i]}
  		if [ $s1 -gt 1 ]; then
			for file in `ls *.${extensions[$i]}`; do			
			size_wc3=$(wc -c < $file | tr -d ' ')
			if [ $size_wc3 -ge $s1 ];then		
			cp $file $target_dir/myArchive	
			fi
			done
			fi	
		done
	cd $target_dir
	tar -cvf myArchive.tar -C $target_dir/myArchive .
	rm -rf $target_dir/myArchive	
  elif [[ $extensions != "" && $size != "" && $target_dir == "" && $destination_dir == "" ]]; then #if extension_list and size is give
	echo "-------------------------------------------------------------"
	echo "Files with given Extension" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	s8=${#extensions[$i]}
  	if [ $s8 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir myArchive
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s9=${#extensions[$i]}
  		if [ $s9 -gt 1 ]; then
			for file in `ls *.${extensions[$i]}`; do			
			size_wc4=$(wc -c < $file | tr -d ' ')
			if [ $size_wc4 -ge $s9 ];then		
			cp  $file myArchive	
			fi
			done
			fi	
		done
	tar -cvf myArchive.tar -C myArchive .
	rm -rf myArchive
elif [[ $extensions != "" && $destination_dir != ""  && $target_dir != "" && $size == "" ]]; then #if extension_list, target and destination is give no size
	cd $destination_dir
	echo "-------------------------------------------------------------"
	echo "Files with given extensions" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	s1=${#extensions[$i]}
  	if [ $s1 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir $target_dir/myArchive
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s1=${#extensions[$i]}
  		if [ $s1 -gt 1 ]; then
			for file in `ls *.${extensions[$i]}`; do					
			cp $file $target_dir/myArchive	
			done
			fi	
		done
	cd $target_dir
	tar -cvf myArchive.tar -C $target_dir/myArchive .
	rm -rf $target_dir/myArchive	
elif [[ $extensions != "" && $destination_dir != ""  && $target_dir == "" && $size == "" ]]; then #if extension_list, destination is give no size
	cd $destination_dir
	echo "-------------------------------------------------------------"
	echo "Files with given extensions" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	s2=${#extensions[$i]}
  	if [ $s2 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir $destination_dir/myArchive
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s11=${#extensions[$i]}
  		if [ $s11 -gt 1 ]; then
			for file in `ls *.${extensions[$i]}`; do					
			cp $file $destination_dir/myArchive	
			done
			fi	
		done
	cd $destination_dir
	tar -cvf myArchive.tar -C $destination_dir/myArchive .
	rm -rf $destination_dir/myArchive
elif [[ $size == "" && $target_dir != "" && $extensions != "" && $destination_dir == "" ]]; then #if extnsion_list, target is given
	echo "-------------------------------------------------------------"
	echo "Files with given extensions" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	s6=${#extensions[$i]}
  	if [ $s6 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir $target_dir/myArchive
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s1=${#extensions[$i]}
  		if [ $s1 -gt 1 ]; then
			for file in `ls *.${extensions[$i]}`; do					
			cp $file $target_dir/myArchive	
			done
			fi	
		done
	cd $target_dir
	tar -cvf myArchive.tar -C $target_dir/myArchive .
	rm -rf $target_dir/myArchive	
elif [[ $extensions != "" && $destination_dir == ""  && $target_dir == "" && $size == "" ]]; then #if extension_list is give
	echo "-------------------------------------------------------------"
	echo "Files with given Extension" 
	echo "-------------------------------------------------------------"
	for (( i=0; i<${tLen}; i++ ));
	do 
  	size10=${#extensions[$i]}
  	if [ $size10 -gt 1 ]; then
	echo "`ls *.${extensions[$i]}`"  	
	fi
	done
	echo "-------------------------------------------------------------"
	mkdir myArchive
		
		for (( i=0; i<${tLen}; i++ ));
		do 
  		s11=${#extensions[$i]}
  		if [ $s11 -gt 1 ]; then
		for file in `ls *.${extensions[$i]}`; do	
			cp $file myArchive	
		done
		fi
		done	
	tar -cvf myArchive.tar -C myArchive .
	rm -rf myArchive
else
   echo "Please Try Again...!!"
   echo "Usage: $0 -s Size -d Destination_Directory(optional) -t Target_Directory(optional) Extensions_List"
fi