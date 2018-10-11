---
layout: "post"
title: "NuGet Tutorial - Web Document Viewer (2018)"
date: "2018-10-11 00:00"
tags: [dotimage, nuget, scriptcs]
comments: true
related: [
    "Introducing NuGet Packages",
    "Introducing Activation Wizard Extension"
]
---
Hi, this is Denis.

This blog entry is an update to our previous article [NuGet Tutorial I - Web Document Viewer]({% post_url 2016-06-21-nuget-tutorial-wdv %}) which was written in 2016. Many things were changed since that, so it's time to update that guide.

<!--more-->

I assume that you have heard about [Web Document Viewer](http://www.atalasoft.com/Technical-Details/net-technical?s=2) (WDV) already and look forward for how to use it!

Here and next I will use VS2017 (15.8.6), so the user interface will be quite different from what we used in original article. And the target framework for the application will be .NET 4.5.2 which is the same as we targets with DotImage assemblies. However you can use any other framework that is more preferable for you.

So, let's start with empty ASP.NET project:

![Create new empty ASP.NET project](/images/2018/10/nuget-tutorial-empty-project.png)

We are going to use Empty ASP.NET template - because we want to see  what exactly should we write to use WDV in our project.

![Select Empty ASP.NET template](/images/2018/10/nuget-tutorial-empty-asp-project.png)

Next step is to add DotImage packages to the project. To do that,
right-click on the project and select *Manage NuGet Packages*:

![Select Empty ASP.NET template](/images/2018/10/nuget-tutorial-add-packages.png)

For the purposes of this tutorial we need to install two packages:

 - **Atalasoft Web Document Viewer** - JavaScript WDV/WDT components including 
   all additional dependencies we have ([jQuery](https://jquery.com/), 
   [Raphael.js](http://dmitrybaranovskiy.github.io/raphael/), 
   [jQuery.UI](https://jqueryui.com/)). It also has a dependency on a [Clipboard.js](https://clipboardjs.com/), but since there are no
   a separate NuGet package for it, we include it in our package.

 - **Atalasoft DotImage WebContorls (32-bit)** - server side code that supports 
   Web Document Viewer. I'm using 32-bit package here, since IIS Express is 32-bit process by default. 
   In real life you may want to choose 64-package.

During installation of these two packages a lot of stuff happens behind the scenes:

 - NuGet infrastructure downloads .NET assemblies along with all dependencies, specified in 
   package definition. All the assemblies are referenced automatically, so you don't need
   to do it explicitly:
   ![.NET References](/images/2018/10/nuget-tutorial-references.png)
 - Web Document Viewer is a JavaScript component that also has some dependencies on 
   other 3rd party libraries. NuGet downloads them as well and adds to the project:
   ![.NET References](/images/2018/10/nuget-tutorial-js-resources.png)

Once you have both packages installed, you are ready to add some code. The process is very 
similar to what is described in our [Dev guide](https://atalasoft.github.io/web-document-viewer/tutorial-demo-application.html) - I will briefly cover it below.

We are going to start with adding Generic Handler to the project 
(right-click on the project and select *Add -> New Item...*) Enter *WebDocViewerHandler* 
as a name of the handler:

![Select Empty ASP.NET template](/images/2018/10/nuget-tutorial-add-handler.png)

Replace generated code with the following:

<script src="https://gist.github.com/guest512/05ce7268b75776c4cd5af31f5a7e53cb.js"></script>

We plan to show PDF files in our viewer, so let's register 
[PdfDecoder class](https://www.atalasoft.com/docs/dotimage/docs/html/T_Atalasoft_Imaging_Codec_Pdf_PdfDecoder.htm)
to support PDF rendering on server side. For web applications, the most simple
way to achieve this is to add *Global.asax* file with the following content:

<script src="https://gist.github.com/guest512/85dbafaadaee2feebe24ac4e1e5e331f.js"></script>

The final thing we need to do on the server side, is to add some files for rendering. 
I created *Documents* folder in my web site structure and put a PDF there:

![Sample PDF Document](/images/2018/10/nuget-tutorial-sample-document.png)

Now we have sever side ready, so we can move on and create a simple *index.html* web page 
(right-click on the project and select *Add -> HTML Page*). Below is HTML markup you 
can use to add and initialize Web Document Viewer / Thumbnailer:

<script src="https://gist.github.com/guest512/d73f6cbbc8499e5a6c33f7b7c877f03e.js"></script>

That's it! You just need to start you web site and in a moment you will see your PDF
file and will be able to play with it using Web Document Viewer:

![Complete Application](/images/2018/10/nuget-tutorial-done.png)

## Conclusion
The steps I described here can be completed in 5-10 minutes even if you try to use Atalasoft toolkit for the first time. But you can achieve the same result even faster if you clone ready-to-go project from GitHub repository we created to hold our tutorial projects - all you need to do is to open the project in Visual Studio and run it - all necessary NuGet packages will be downloaded automatically during the build. 
