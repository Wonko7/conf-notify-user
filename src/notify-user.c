/*
** notify-user.c for src in src
**
** Made by William Caldwell aka 
** Login   <william@undefined.re>
**
** Started on  Mon 11 Mar 2019 12:50:03 PM CET William Caldwell
** Last update Mon 11 Mar 2019 12:50:03 PM CET William Caldwell
*/
#include <unistd.h>
#include <errno.h>
#include <stdio.h>

extern char **environ;

int
main(int              argc __attribute__((unused)),
     char**           argv)
{
  int                 err    = 0;

  err = execv("/usr/bin/notify-send", argv);
  if (err == -1)
    perror(NULL);
  return err;
}
