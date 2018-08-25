/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main_ft_printf.c                                   :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: kehuang <kehuang@student.42.fr>            +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/08/25 10:46:47 by kehuang           #+#    #+#             */
/*   Updated: 2018/08/25 10:56:45 by kehuang          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

int		ft_printf(char const *fmt, ...);

#include <stdio.h>
#include <stdlib.h>

#define RET "ret = %d\n"

int		dtest(int (*out)(char const *, ...), char *str, void *varg)
{
	int		n;

	n = (int)varg;
	return (out(str, n));
}

int		main(int argc, char **argv)
{
	int		(*out[2])(char const *, ...) = {&printf, &ft_printf};
	int		(*test[10])(int (*f)(char const *, ...), char *, void *) = {
		&dtest,
//		&utest, &otest, &xtest, &x_test, &ptest,
//		&ctest,
//		&stest,
//		&c_test,
//		&s_test
	};
	int		i;
	int		start;
	int		end;

	if (argc != 4) {
		printf("usage: %s: [0-1] <fmt> string\n", argv[0]);
		printf("[0-1]: 0 == printf; 1 == ft_printf\n");
		printf("<fmt>: duoxXpcsCS\n");
		printf("string: %%d\\n\n");
		return (-1);
	}
	if (argv[2][0] == 'd') {
		start = -500;
		end = 500;
	}
	else {
		start = 0;
		end = 1000;
	}

	i = atoi(argv[1]);
	for (int c = start; c < end; c++)
		out[i](RET, out[i](argv[3], c));
	return (0);
}
