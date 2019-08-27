# AngularLocalDocker

This project was generated with [Angular CLI](https://github.com/angular/angular-cli) version 8.0.1.

## Edit package.json
The package.json _start_ script should be edited as follow:
```bash
...,
"scripts": {
    "ng": "ng",
    "start": "ng serve --host 0.0.0.0 --poll 1",
    "build": "ng build",
    "test": "ng test",
    "lint": "ng lint",
    "e2e": "ng e2e"
  },
...
```

# Build Docker Image
```bash
docker build -t ng-local-docker .
```

# Run an instance of the image
```bash
docker-compose up
```
## FYI
1. NodeJs v10.16.0 was installed locally to create this angular project.
2. Delete the _node_modules_ dir installed when the project is created as we want these to be installed inside the docker image.
```bash
rm -rf /node_modules
```
## Objective
I'm constantly switching between NodeJs v4.X, v6.X and v10.X projects and I would like to avoid having to manage NodeJs version using nvm. I'm trying a setup that relies on each project having a base docker image to contain node_modules and then map my drive (application source code) to the container as I develop on my local machine.

## Current Challenge
The docker-compose configuration in this project ovewrites/hides the files (node_modules) that are inside the container when it runs. I had to install the _node_modules_ in a temp folder, then move the folder over to the dir location of the mapped volume at run time. The major drawback here is the length of time it takes to copy the entire _node_modules_ dir into the mapped volume (3-5 mins from Win10 linux containers).
