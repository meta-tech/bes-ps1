bes-ps1
========

bes-ps1 is a small bash program to easily manage prompt shell

![bes-ps1-display](https://www.meta-tech.academy/img/bes-ps1.png?tmp=1)

it let you show/hide :

* current date
* environment context (LOCAL|DEV|INT|PROD)
* context name
* working directory path
* current git branch in working directory

you also can customize colors in rgb mode.

### Install

```
wget https://raw.githubusercontent.com/meta-tech/bes-ps1/latest/dist/bes-ps1
bash ./bes-ps1 -i
```

if you need to install to another user, log in as selected user, then run

```
bes-ps1 -i
```

![bes-ps1-install](https://www.meta-tech.academy/img/bes-ps1-install.png?tmp=1)


### Customizing prompt shell

simply edit `~/.bash_ps1`

```
    function bes.ps1.init() {
        . /usr/share/bes/ps1
        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        # ~~ FLAG 0|1 (disable|enable)
        local  BES_PS1_ACTIVE_DATE=1
        local   BES_PS1_ACTIVE_CTX=1
        local  BES_PS1_ACTIVE_NAME=1
        local  BES_PS1_ACTIVE_PATH=1
        local   BES_PS1_ACTIVE_GIT=1
        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        # ~~ OVERLOAD DEFAULT COLORS (CTX is predifined depending on related ENV)
        local   BES_PS1_COLOR_DATE="255 215  15"
        local   BES_PS1_COLOR_USER="255 232 160"
        local   BES_PS1_COLOR_ROOT="237 164 115"
        local   BES_PS1_COLOR_PATH=" 74 160 198"
        local   BES_PS1_COLOR_HOST="255 255 255"
        local    BES_PS1_COLOR_GIT="237 164 115"
        local BES_PS1_COLOR_SYMBOL="255 195 135"
        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        # -- INSTANCE COLORS - use for example in dockerfile
        #~ export BES_PS1_BG=154 99 170
        #~ export BES_PS1_FG=255 255 255
        # -- INSTANCE ENVIRONMENT (LOCAL|DEV|INT|PROD)
        #~ export BES_PS1_CTX=DEV
        # -- INSTANCE NAME
        #~ export BES_PS1_NAME=home
        # -- INSTANCE TYPE (VM|DOCKER|whatyouwant)
        #~ export BES_PS1_TYPE=DOCKER
        # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        bes.ps1
    }
```
by enabling/disabling flag in `~/.bash_ps1` you will obtain :

![bes-ps1-sample3](https://www.meta-tech.academy/img/bes-ps1-sample3.png?tmp=2)

you can also export some BES_PS1_X var to customize your prompt like :

![bes-ps1-sample2](https://www.meta-tech.academy/img/bes-ps1-sample2.png?tmp=2)

or declare env var for example in a docker file :

![bes-ps1-sample1](https://www.meta-tech.academy/img/bes-ps1-sample1.png?tmp=3)



### View changes immediatly

source your .bashrc file :

```
. ~/.bashrc
```
