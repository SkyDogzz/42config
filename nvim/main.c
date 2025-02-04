/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tstephan <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/04 18:40:08 by tstephan          #+#    #+#             */
/*   Updated: 2025/02/04 18:40:36 by tstephan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "here.h"
#include <stdio.h>

void	*foo(int argc, char *argv[])
{
	return (&foo);
}

int	main(int argc, char *argv[])
{
	void	*addr;

	addr = foo(argc, argv);
}
