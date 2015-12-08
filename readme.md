A small example of a Kha game that loads a image and use the keyboard and mouse

### How to use

**Kha from git**  
Install [nodejs]  
On the command line, run:
```
git clone https://github.com/RafaelOliveira/BasicKha  
cd BasicKha  
git submodule update --init --recursive
node Kha/make html5
```
Then open the FlashDevelop project for html5 in the build folder.

To update Kha, you can run:  
```
git submodule foreach --recursive git pull origin master
```

**Kha from haxelib**  
Kha made a big update, so I'm waiting for the next haxelib release to update the instructions.  

For bigger projects, the git version is recommended, because all the tools to compile the project (including haxe) are included and can be versioned. You only need to install nodejs.

[nodejs]:https://nodejs.org
