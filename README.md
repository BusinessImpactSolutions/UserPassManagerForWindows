# User Pass Manager on Commandline for Windows

Before you do anything, please create a file called `up.up` in your home directory on Windows, 

    C:/Users/USER/up.up

making sure the file extension stays/remains as '.up'; Not '.txt' if you use a utility like notepad.


## Installation

Our recommended method to install this software on Windows operating systems is to use 

    git clone 


### Using git clone 

This is the recommended method of installation

    cd C:\Users\USER\u;

    git clone https://github.com/BusinessImpactSolutions/UserPassManagerForWindows.git


### Using cpanm

Not recommended

    PS C:\Users\USER\> cpanm Upm4win


## Usage

Usage 

First, change directory to: 

    cd C:\Users\USER\u\UserPassManagerForWindows

where all the necessary files reside


### Search for an item

perl .\lib\Upm4win\up.pl s anything


### Add an item 

    perl .\lib\Upm4win\up.pl a 'user|pass|any|other|details'


### Get total records in FDB

    perl .\lib\Upm4win\up.pl t

