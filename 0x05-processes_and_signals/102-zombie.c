#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
/**
 * infinite_while - infinit while
 *
 * Return: 0
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}
/**
 * main - create 5 zombie processe
 *
 * Return: void
 */
int main(void)
{
	pid_t pid;
	int i;

	for (i = 0; i < 5; i++)
	{
		pid = fork();
		if (pid <= 0)
			return (0);
		printf("Zombie process created, PID: %d\n", pid);
	}
	infinite_while();
	return (1);
}
