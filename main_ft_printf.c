/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_ft_printf.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kehuang <kehuang@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/08/25 10:46:47 by kehuang           #+#    #+#             */
/*   Updated: 2018/09/14 12:39:34 by kehuang          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		ft_printf(char const *fmt, ...);

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define RET "ret = %d\n"
#define SCONVERTER "duoxXpcs"

int		get_cvt(char *s) {
	char const	*sconv = SCONVERTER;
	char	*pos;

	if (s[0] == '\0' || s[1] != '\0'
			|| ((pos = strchr(sconv, s[0])) == NULL))
		return (-1);
	return ((int)(pos - sconv));
}

int		dtest(int (*out)(char const *, ...), char *str, void *varg) {
	return (out(str, (long)varg));
}

int		utest(int (*out)(char const *, ...), char *str, void *varg) {
	return (out(str, (unsigned long)varg));
}

int		ctest(int (*out)(char const *, ...), char *str, void *varg) {
	return (out(str, (char)varg));
}

int		main(int argc, char **argv)
{
	int		(*out[2])(char const *, ...) = {&printf, &ft_printf};
	int		(*test[10])(int (*f)(char const *, ...), char *, void *) = {
		&dtest,
		&utest, &utest, &utest, &utest, &utest,
		&ctest,
//		&stest,
//		&c_test,
//		&s_test
	};
	int		fconverter_idx;
	int		i;
	int		start;
	int		end;

//	usage
	if (argc != 4) {
		printf("usage: %s: [0-1] <fmt> string\n", argv[0]);
		printf("[0-1]: 0 == printf; 1 == ft_printf\n");
		printf("<fmt>: duoxXpcsCS\n");
		printf("string: %%d\\n\n");
		return (-1);
	}

//	get the converter test function
	if ((fconverter_idx = get_cvt(argv[2])) < 0) {
		printf("Not a valid converter\n");
		return (-1);
	}

//	delim test for integer
	if (argv[2][0] == 'd') {
		start = -500;
		end = 500;
	}
	else if (argv[2][0] == 'c') {
		start = -300;
		end = 300;
	}
	else {
		start = 0;
		end = 1000;
	}

//	get the function 0 == printf :: 1 == ft_printf
	i = atoi(argv[1]);
	if (i > 1)
		i = 1;
	if (i < 0)
		i = 0;

//	launching the test
	if (fconverter_idx < 7) {
		for (int c = start; c < end; c++)
			out[i](RET, out[i](argv[3], c));
		out[i](RET, out[i](argv[3], -2147483648));
		out[i](RET, out[i](argv[3], 2147483647));
		out[i](RET, out[i](argv[3], -2147483649));
		out[i](RET, out[i](argv[3], 2147483648));
		out[i](RET, out[i](argv[3], 4294967296));
		out[i](RET, out[i](argv[3], 4294967297));
	}
	else
		out[i](RET, out[i](argv[3], 42));
	return (0);
}
