# warus
Response to muskovien invasion in Ukraine

Small set of scripts to response for muskovien attack.

# How to use

## Copy scripts to your linux machine and crete ssh keys

```bash
$ git clone https://github.com/coozoo/warus
$ cd warus
```

Replace your mail in the following command below with mail wich vultr registered for

```bash
$ ssh-keygen -t rsa -b 4096 -C "placeyourvultrsmailhere@gmail.com"
```
in prompt enter filename for exampel ssh.key we will use that key for vultr later


## Setup Cloud

You need to create account on some cloud service for example you can use vultr

vultr.com

1 instance about 5 dollars per month

Generate and add ssh.key as described before. And Add this key to vultr account

Profile (top right menu) -> sshkeys -> add button

Insert content of whole pub file into vultr and assign any name for that.

Create instances as folowing.

 - go to products (left site bar)
 - click + button on the top right corner
 - you will see options to create cloud select "Cloud compute", next location of clous for example asia and here japan, korea or any other, nextselect "Debian", and nex plan 5 usd / month, and select key that you've previously added
 - click "Deploy now"
 
 In the following screen wait till ip will be assigned to new instance
 
 ## setting up scripts
 
 Copy IP of your cloud to clipboard and paste as new line into "genips" file, you can paste as many IPs as you want.
 
 after that you just need to launch (you can use vpn to hide your traces):
 
 ```bash
 $ ./launch.sh
 ```
 ## modify targets
 
 list of targets it's one line file "targets", you can add or remove some targets by simple edditing.
 
 after that you just need to relaunch ./launch.sh
 
