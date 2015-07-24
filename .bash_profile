###############################################
# General settings
###############################################
export EDITOR=vim
export LD_LIBRARY_PATH="/usr/X11R6/lib:"$LD_LIBRARY_PATH

###############################################
# Perforce
###############################################
export P4CLIENT=$USER
export P4PORT=perforce.athenahealth.com:1666
export P4_HOME=/home/$USER/p4

# If using perforce in windows, uncomment this line
# export P4WINROOT=z:\\p4

# If not using perforce in windows, uncomment these lines
export P4LOCALROOT=$P4_HOME
export P4WINROOT=$P4_HOME

###############################################
# Athena Home
###############################################
export ATHENA_HOME="$P4_HOME/prod/"
export MASTER_ROOT_INSTANCE=PTEST1
export INTRANET_HOME="$P4_HOME/intranet"

###############################################
# Athena-specific config
###############################################
export EMAILINTERCEPTADDRESS="$USER@athenahealth.com"
export BARCODEWEBSERVICELOC=http://ars-anetsrv1.corp.athenahealth.com/perl/barcode/ws.pl
export CURLPROXY=link1.athenahealth.com:8000
export MEMCACHEDPOOL=DEV
export FILEROOT=/home/$USER/fileroot
export REDIRECT_PERL_FILEROOT=1
export WIKI_HOME=/home/$USER/wiki
export PATH="/usr/local/athena/prod/local/5.16//:$ATHENA_HOME/local/5.16/lib/perl5:$HOME/bin:$P4_HOME/intranet/bin:$P4_HOME/techops/coredev/:$P4_HOME/techops/coredev/bin:$P4_HOME/intranet/scripts/qa:/usr/local/athena/techops/prodsys/patch/:$PATH"

export PATH=/usr/local/athena/prod/local/5.16/bin/:$PATH
###############################################
# Optional settings
###############################################
# Automatically highlight matches with grep
export GREP_OPTIONS=--color=auto
# Format the bash command prompt
export PS1='\[\e[1;31m\]\u@\h:\[\e[1;34m\]\w\[\e[1;26m\]\$\[\e[0;1m\] '
# Override the default ls colors
export LS_COLORS="no=00:fi=00:di=01;34:ln=00;36:pi=40;32:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31:ex=00;32:"
# Set a path for locallib
export LOCALLIB=/home/deder/local/

##############################################
# START CUSTOM COMMANDS
##############################################

alias ppidump="perl -MAthena::Lib -MPPI::Document -MPPI::Dumper -e 'PPI::Dumper->new( PPI::Document->new( @ARGV ), whitespace => 0 )->print()'"
##############################################
# Quick movement around p4 directory
##############################################
export p=~/p4/prod
export i=~/p4/intranet
export path=~/p4/prod/perllib/Athena
export iath=~/p4/intranet/perllib/Athena
alias p='cd ~/p4/prod'
alias i='cd ~/p4/intranet'
alias path='cd ~/p4/prod/perllib/Athena'
alias iath='cd ~/p4/intranet/perllib/Athena'

##############################################
# Shorten p4 and p4 related commands
##############################################
alias p4e='p4 edit'
alias p4r='p4 revert'
alias synchead='perl $P4_HOME/techops/coredev/p4/syncclient.pl'

# P4 edit and open file
openandedit(){
	p4 edit $1
	vim $1
}
alias p4v=openandedit



##############################################
# The sudo build command is hard XD
##############################################
alias subuild='sudo su - build'

##############################################
# I run workers all day
##############################################
alias prod_worker="RUNWORKUNITSINPROCESS=0 ISDEVSERVER=Y perl ~/p4/prod/scripts/app/platform/worker.pl --nodaemon --config ~/.worker.conf"
alias run_prod_workflow="RUNWORKUNITSINPROCESS=0 ISDEVSERVER=Y perl $ATHENA_HOME/scripts/app/platform/run_workflow.pl --workflow"
alias weblog_worker="RUNWORKUNITSINPROCESS=0 ISDEVSERVER=Y MASTER_ROOT_INSTANCE=WEBLOG1 perl -M'Athena::Lib qw(:intranet)' ~/p4/prod/scripts/app/platform/worker.pl --nodaemon --config ~/.worker.conf"
alias run_weblog_workflow="RUNWORKUNITSINPROCESS=0 ISDEVSERVER=Y  MASTER_ROOT_INSTANCE=WEBLOG1 perl -M'Athena::Lib qw(:intranet)' $ATHENA_HOME/scripts/app/platform/run_workflow.pl --workflow"

##############################################
# Quickly source bash profile
##############################################
alias bp='source ~/.bash_profile'

source ~/.bashrc
source $P4_HOME/techops/coredev/utils/navigation_utilities.sh
