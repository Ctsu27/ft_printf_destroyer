#!/bin/sh
bin=destroyer

#i = 0
dtest=(
"%%d: [%d]"
"%%d: [%50d]"
"%%d: [%4d]"
"%%d: [%3d]"
"%%d: [%2d]"
"%%d: [%1d]"
"%%d: [%0d]"
"%%d: [%01d]"
"%%d: [%02d]"
"%%d: [%03d]"
"%%d: [%04d]"
"%%d: [%040d]"
"%%d: [%.0d]"
"%%d: [%.d]"
"%%d: [%.3d]"
"%%d: [%.10d]"
"%%d: [%.40d]"
"%%d: [%40.40d]"
"%%d: [%40.38d]"
"%%d: [%38.40d]"
"%%d: [%1.4d]"
"%%d: [%4.1d]"
"%%d: [%18.0d]"
"%%d: [%1.0d]"
"%%d: [%01.0d]"
"%%d: [%018.0d]"
"%%d: [%010.20d]"
"%%d: [%010.10d]"
)

#echo ${dtest[0]}
#echo ${dtest[1]}
#echo ${dtest[2]}

#	av[1] == pf || ft_pf
#	av[2] == str test


for str in "${dtest[@]}"
do
	./$bin 1 $str > rl_pf;
	./$bin 0 $str > ft_pf;
	if ! diff -s rl_pf ft_pf;
	then
		echo "\033[0;31merror:\033[0m $str"
	fi
done


#./a.out 1 stest[0] >> rl_pf
#./a.out 0 stest[0] >> ft_pf
