# Instruction how to open blog locally

## Windows 10 / Windows 2016+

### Prerequisites

You should have installed Windows 10 Pro or Enterprise, or Windows 2016 or newer, and enabled Hyper-V feature. You can find instruction how to do this [here](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v).

### Setup

The next step is to install to Docker CE (EE) for Windows, from [here](https://store.docker.com/editions/community/docker-ce-desktop-windows). And test it by running the next command in cmd or PowerShell

```bash
docker run hello-world
```

The last step is to setup Shared drive in Docker, use the drive where this blog is located, for instance, if you downloaded this repo to `F:\Git\repos\atalasoft.github.io` then you should setup shared drive `F`.

### Run

Use the `blogLauncherWin10.cmd` from command line. It will builds the docker image from Dockerfile and run it with `docker-compose`. The blog will be available on `http://localhost:5000`. That's it! Now you can modify blog repo locally while all changes will be reflected in docker image and jekyll will regenerate the blog.

## Windows 7

### Setup

Since the Windows 7 doesn't have Hyper-V support, only the Docker Toolbox is available as an option for you. You can download it [here](https://docs.docker.com/toolbox/toolbox_install_windows/). As a dependency you also must have installed [Oracle VM Virtual Box](https://www.virtualbox.org/), this is default hypervisor where Docker Toolbox will run its VM.

In order to run all commands related to docker you must launch `Docker Quickstart Terminal` as Administrator (with elevated permissions).

To test installed Docker Toolbox you should run the next command

```bash
docker run hello-world
```

After this command, close the `Docker Quickstart Terminal` and launch a VirtualBox management console. There you should find a `default` VM, and you should setup its [Shared folders](https://www.virtualbox.org/manual/ch04.html#sharedfolders). You need to add a Windows path to this blog as a path to the mounted folder. For instance:

```
NAME: F:\Git\repos\atalasoft.github.io
PATH: /f/Git/repos/atalasoft.github.io
```

This is needed to make folder mounting work correctly when you start docker image under the `Docker Quickstart Terminal`.

### Run 

Run the `blogLauncherWin7.sh` from `Docker Quickstart Terminal`. It will builds the docker image from Dockerfile and run it with `docker-compose`. The blog will be available on `http://192.168.99.100:5000`. That's it! Now you can modify blog repo locally while all changes will be reflected in docker image and jekyll will regenerate the blog.