#!/bin/sh
bin=destroyer
ccdes=compil.sh
if ! [ -f "$bin" ] || ! [ -x "$bin" ];
then
	if ! [ -f "$ccdes" ] || ! [ -x "$ccdes" ];
	then
		echo "$bin and $ccdes do not exist";
		exit -1;
	fi
	sh compil.sh;
fi

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
"%%d: [%.1d]"
"%%d: [%.2d]"
"%%d: [%.3d]"
"%%d: [%.4d]"
"%%d: [%.10d]"
"%%d: [%.40d]"

"%%d: [%40.40d]"
"%%d: [%40.38d]"
"%%d: [%38.40d]"
"%%d: [%1.4d]"
"%%d: [%1.1d]"
"%%d: [%2.2d]"
"%%d: [%4.1d]"
"%%d: [%18.0d]"
"%%d: [%1.0d]"

"%%d: [%01.0d]"
"%%d: [%018.0d]"
"%%d: [%010.20d]"
"%%d: [%010.10d]"

"%%d: [% d]"

"%%d: [% 10d]"
"%%d: [% 1d]"
"%%d: [% 2d]"
"%%d: [% 4d]"
"%%d: [% 40d]"

"%%d: [% 01d]"
"%%d: [% 02d]"
"%%d: [% 04d]"
"%%d: [% 010d]"

"%%d: [% 10.0d]"
"%%d: [% 10.2d]"
"%%d: [% 10.4d]"
"%%d: [% 10.10d]"

"%%d: [% 010.0d]"
"%%d: [% 010.2d]"
"%%d: [% 010.4d]"
"%%d: [% 010.10d]"
"%%d: [% 010.20d]"

"%%d: [%+d]"
"%%d: [%+1d]"
"%%d: [%+2d]"
"%%d: [%+3d]"
"%%d: [%+4d]"
"%%d: [%+10d]"
"%%d: [%+20d]"

"%%d: [%+01d]"
"%%d: [%+02d]"
"%%d: [%+03d]"
"%%d: [%+04d]"
"%%d: [%+010d]"
"%%d: [%+020d]"

"%%d: [%+.1d]"
"%%d: [%+.2d]"
"%%d: [%+.3d]"
"%%d: [%+.4d]"
"%%d: [%+.10d]"
"%%d: [%+.20d]"

"%%d: [%+1.1d]"
"%%d: [%+2.2d]"
"%%d: [%+3.3d]"
"%%d: [%+4.4d]"
"%%d: [%+10.10d]"
"%%d: [%+20.20d]"

"%%d: [%+2.1d]"
"%%d: [%+3.2d]"
"%%d: [%+4.3d]"
"%%d: [%+5.4d]"
"%%d: [%+15.10d]"
"%%d: [%+25.20d]"

"%%d: [%+2.3d]"
"%%d: [%+3.4d]"
"%%d: [%+4.5d]"
"%%d: [%+5.6d]"
"%%d: [%+15.18d]"
"%%d: [%+25.28d]"

"%%d: [%+01.1d]"
"%%d: [%+02.2d]"
"%%d: [%+03.3d]"
"%%d: [%+04.4d]"
"%%d: [%+010.10d]"
"%%d: [%+020.20d]"

"%%d: [%+02.1d]"
"%%d: [%+03.2d]"
"%%d: [%+04.3d]"
"%%d: [%+05.4d]"
"%%d: [%+015.10d]"
"%%d: [%+025.20d]"

"%%d: [%+02.3d]"
"%%d: [%+03.4d]"
"%%d: [%+04.5d]"
"%%d: [%+05.6d]"
"%%d: [%+015.18d]"
"%%d: [%+025.28d]"
)

cvt=(
"d"
"u"
"o"
"x"
"X"
"p"
"c"
"s"
#"C"
#"S"
)


#	av[1] == pf || ft_pf
#	av[2] ? == converter duoxXpcsCS
#	av[2] 3 ? == str test

#i=0
#while cvt[i] != "" do
for str in "${dtest[@]}"
do
#	./$bin 1 $cvt[i] $str > rl_pf;
#	./$bin 0 $cvt[i] $str > ft_pf;
	./$bin 1 $str > rl_pf;
	./$bin 0 $str > ft_pf;
#	if ! diff -s rl_pf ft_pf;
	if ! diff rl_pf ft_pf;
	then
		echo "\"$str\" \033[0;31mKO\033[0m"
	else
		echo "\"$str\" \033[0;32mOK\033[0m"
	fi
done
