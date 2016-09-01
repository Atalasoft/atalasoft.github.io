---
layout: "post"
title: "Web Document Viewer - Bower package"
date: "2016-09-01 10:00"
tags: [dotimage, Bower]
comments: true
related: [
    "NuGet Tutorial I - Web Document Viewer"
]
---

**Motivation**

Since lately we have introduced NuGet packages for our [Web Document Viewer component](http://atalasoft.github.io/2016/06/21/nuget-tutorial-wdv/) we have worked out another scenario of separating frontend and backend development. There are special package managers to deliver frontend components only. We have looked into them and chosen [Bower](https://bower.io/). Therefore we created a new package for introducing the ability to manage our viewer as a standard frontend web component.

**Introduction**

[Bower](https://bower.io/) is a package manager for frontend dependencies. Bower has a cross-platform support and can be used outside .Net projects. 

The Web Document Viewer component is included in our main product [DotImage](http://www.atalasoft.com/Products/DotImage) and the files distributed in the Bower package are also available as a part of DotImage standalone installation, as well as they can be obtained from the [NuGet package](http://atalasoft.github.io/2016/06/21/nuget-tutorial-wdv/). But as soon as we speak about cross-platform frontend development we need to use frontend-specific package, i.e. supported by Bower.

In this article we are going to step through a simple application creation using our new Bower package called [web-document-viewer](https://github.com/Atalasoft/web-document-viewer).

**How to install Bower**

Bower installation is held using [npm](https://www.npmjs.com/). Npm is also an online repository for JavaScript dependencies, but it implies server-side JavaScript components management (NodeJS). The difference between npm and Bower lies mainly in the way of managing the dependencies concerning versioning. Bower dependencies can contain only one version of a concrete library (i.e. JQuery 1.8.3), so that dependency tree has a linear structure, whereas npm dependencies may reference to different versions of a concrete library (i.e. JQuery 1.8.3 for one component and JQuery 3.1.0 for another component), so that the dependency tree may have a deep tree structure.

Bower prerequisites are [node, npm](http://nodejs.org/) and [git](http://git-scm.org/).

To install Bower using git bash type the following command:

{% highlight bash %} $ npm install -g bower {% endhighlight %}

[Previously](http://atalasoft.github.io/2016/06/21/nuget-tutorial-wdv/) we have described how to create a simple application using our NuGet packages. Here we are going to describe a similar thing, but for frontend Bower package. So we will use both NuGet (for server-side) and Bower (for client-side).

**Using Bower with Visual Studio 2015**

The steps to setup a simple project we want to include our package into are the following:

1.	Create ASP.NET Web Application (File->New->Project) as it is shown in the screenshots below.
 ![New Project](/images/2016/09/1.png) 
 ![New Web Spplication](/images/2016/09/2.png)
2.	Include NuGet package Atalasoft.dotImage.WebControls to support server-side logics. (The same as it is described [here](http://atalasoft.github.io/2016/06/21/nuget-tutorial-wdv/), see the screenshots below.)
 ![Manage NuGet Packages](/images/2016/09/3.png)
 ![WebControls x64](/images/2016/09/4.png)
3.	Implement server-side like [here](http://atalasoft.github.io/2016/06/21/nuget-tutorial-wdv/). Add a new Generic Handler and inherit it from WebDocumentRequestHandler class from Atalasoft.Imaging.WebControls namespace as it is shown below.
 ![Add a Generic Handler](/images/2016/09/5.png)
 ![Simple Handler](/images/2016/09/6.png) 
 <script src="https://gist.github.com/ElenaLenchic/46118aeb13f38396eab3124fccd4624f.js"></script>
 And now our server-side logics is ready. We are going to implement the client-side logics.
4.	Add a Bower configuration file to the project.
![Add Bower config](/images/2016/09/7.png)
5.	Open recently added bower.json file and add a new dependency "web-document-viewer".
![Edit Bower config](/images/2016/09/8.png)
6.	Save the file. The dependencies will be downloaded automatically into the default folder "bower_components" ([configurable](https://bower.io/docs/config/)). You can see it when browsing the directory with the project. It is useful to include this directory in the project.
![Show all files](/images/2016/09/9.png)
![Include in project](/images/2016/09/10.png)
There is also another way to manage Bower dependencies. It is presented in the context menu for the project. 
![Manage Bower packages](/images/2016/09/11.png)
This command will show the list of installed Bower packages:
![Manage Bower packages Installed](/images/2016/09/12.png)
As you see the "web-document-viewer" and also "jquery-easing" are not listed here. We have posted a question about it on [Social Microsoft website forum](https://social.msdn.microsoft.com/Forums/vstudio/en-US/bcf8f403-ac9a-4d3c-8471-a9e2e2ff119e/bower-package-manager-in-visual-studio-2015-does-not-find-bower-packages?forum=visualstudiogeneral) and [Bower GitHub issues](https://github.com/bower/bower.github.io/issues/264). In fact there is a number of packages that do not appear in the Visual Studio UI Package Manager for Bower. Hopefully, this issue is soon resolved.
<br/> We can also switch to the "Browse" tab in the Bower Package Manager to see all the available packages:
![Manage Bower packages Browse](/images/2016/09/13.png)
 We can install, uninstall or update packages using corresponding buttons. There is also an option to save these changes to bower.json file (ticked by default).
7.	Add a new index.html file into the project.
![Add html page](/images/2016/09/15.png)
![specify name index.html](/images/2016/09/16.png)
8.	Replace all the code with the following:
 
 **Example code**
 <script src="https://gist.github.com/ElenaLenchic/db540f18316050f83433868f734ed454.js"></script>
 Now we are ready to start our application.
 <br/>**Note:** If you have installed 64-bit version of DotImage library you need to set a proper Solution platform:
 ![Platform configuration](/images/2016/09/17.png)
 As well as before launching it is necessary to tick "Use the 64 bit version of IIS Express for web sites and projects" in the option dialog window (Tools->Options).
 ![Web project options](/images/2016/09/18.png)
 Then we can press F5 to launch the application.
 <br/>As an example we can open a test file located in our test images directory (using a browser console):

{% highlight bash %} 
_thumbs.openUrl('./TestImages/Test.tif') 
{% endhighlight %}

As a result we see the Test.tif file opened in the Web Document Viewer:

![WDV in browser](/images/2016/09/19.png)
 **Using Bower with console**
 
 The same bower package management can be done using console.
 
 At first we need to browse to the directory where we are going to install dependencies in the git bash console.
 * To initialize Bower type the following command:
 
 {% highlight bash %} $ bower init {% endhighlight %}
 
 This will open file bower.json in the current direcory or initiate its creation in interactive mode: 
 ![Bower init](/images/2016/09/14.png)
 
 After filling in all fields the interactive mode and confirming that it looks good the file bower.json will appear or update in the current browsing directory.
 
 * To install web-document-viewer package type the following command:
 {% highlight bash %} $ bower install --save web-document-viewer#10.7.0 {% endhighlight %}
 
 This will install the "web-document-viewer" component with all its dependencies. By default all downloaded files are placed in the folder bower_components. However this can be [configured](https://bower.io/docs/config/). The installed files can be referenced using this path. I.e.
 
 {% highlight  html %}
 <script src="bower_components/atalasoft-web-document-viewer/atalaWebDocumentViewer.js" type="text/javascript"></script>
 {% endhighlight %}
 
 The complete example code is presented earlier in this article.
 
 Option {% highlight bash %}--save{% endhighlight %} indicates that it is necessary to save the installed package into the current Bower configuration file.
 
 The numbers after # indicate the version of the package it is necessary to install.
 
 All downloaded dependency files are placed by default in the "bower_components" folder, where it can set references directly or copy the files into another folder. There are tools like [Gulp](http://gulpjs.com/), [Grunt](http://gruntjs.com/) and [others](https://bower.io/docs/tools/) to automate these files management. They are task-runners that can (among other commands) execute files copying before build etc.


**A few words about Bower package configuration file**

Bower configuration file (bower.json) is obligatory for each Bower package. It can be created while development and kept in actual state, which is quite useful when working with a project: the same configutation file for development and package distribution. It contains package name, licensing information, list of dependencies etc. It is downloaded as a part of a package. It also includes the names of the main files of the package to be included as a script or a stylesheet reference into the web-page and the file versions.

Bower package contains meta-information about the Bower package. More information about creating Bower packages is available [here](https://bower.io/docs/creating-packages/).

**References**

1.	Bower [https://bower.io/](https://bower.io/)
2.	Atalasoft blog archive on GitHub [http://atalasoft.github.io/archive/](http://atalasoft.github.io/archive/)
4. Atalasoft web site [https://www.atalasoft.com/](https://www.atalasoft.com/)
3.	Atalasoft NuGet Tutorial [http://atalasoft.github.io/2016/06/21/nuget-tutorial-wdv/](http://atalasoft.github.io/2016/06/21/nuget-tutorial-wdv/)
