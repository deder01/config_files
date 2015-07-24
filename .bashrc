if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.
alias p4=auto_local_p4
alias prettysql='/home/twilliams/bin/python /home/twilliams/bin/sqlformat --reindent'
alias unharr='ctl stop'
alias nytprofhtml='PERL5LIB=/usr/local/athena/prod/local/5.16/lib/perl5/x86_64-linux nytprofhtml'

# While in screen always refreshes the .bash_history (from Sam Scarano via Miki on Tech-Dev)
export PROMPT_COMMAND='history -a; history -r'
