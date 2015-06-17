# biskein
Install Heroku buildpacks on bare servers

## Quick Start
First set up the machine. This prepares it to emulate a Heroku instance.
```bash
cd biskein
./bootstrap
```

Now download your Heroku application to `~/source` and run
```bash
./biskein/install_app
```
The build pack URL needs to be in the `.buildpacks` file.

For example, an R server can be created by copying the 
[Heroku R Rook Server](https://github.com/zatonovo/heroku-buildpack-r) project, 
which uses the [R Buildpack](https://github.com/zatonovo/heroku-buildpack-r).
