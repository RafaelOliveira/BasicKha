A small example of a Kha game that loads a image and use the keyboard and mouse

### How to use

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

[nodejs]:https://nodejs.org
