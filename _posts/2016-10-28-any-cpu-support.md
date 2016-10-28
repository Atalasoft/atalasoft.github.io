---
layout: "post"
title: "Any CPU Support (kind of)"
date: "2016-10-28 10:00"
tags: [dotimage, nuget, anycpu]
comments: true
related: [ "Introducing NuGet Packages" ]
---
AnyCPU is great. Period. You don't need to think about architecture. It just works.
Everyone loves to build AnyCPU applications, they are much easier to port to
different platforms (hello [Mono](http://www.mono-project.com/),
hello [.NET Core](https://www.microsoft.com/net/core)), they are supported on both
x86 and x64 architectures.

<!--more-->

There is only one disadvantage. You are not always able to build AnyCPU assembly.

> disappointed noise, tears, people stop programming and start visiting kitchen
> classes - a great choice of profession to be honest.

Why you can't? Typical reasons:

 - 3rd party library you use is not available as AnyCPU.
 - You have portion of the library written in C++

I guess these are the most common reasons, at least we are facing them here in
Atalasoft - we have a number of dependencies that are architecture-specific,
so we are forced to provide both x86 and x64 flavors of our assemblies.

**We** are forced, but **you** don't have to be! There is an easy trick that would
allow you to build AnyCPU apps using architecture-specific DotImage assemblies.
Sounds like magic? Read on! :)

## Technical Details
Solution is pretty simple - we just need to add a bit of intelligence and load
correct version of an assembly at runtime, depending on process architecture.

There are some small tricks to make this mechanism work under IIS with
[shadow copy enabled](https://msdn.microsoft.com/en-us/library/ms404279.aspx), but
luckily it is pretty easy to achieve. Basically, here is the annotated code that does the trick:

 <script src="https://gist.github.com/kolomiets/162562a0aacae96c951f0de4aba6394e.js"></script>

## Project configuration
Additional project configuration is required to simplify deployment of architecture
specific assemblies during project build.

First, we need to disable *Copy Local* setting for referenced assemblies
to prevent them from being copied to output folder during project build:

![Copy Local configuration](/images/2016/10/any-cpu-demo-copy-local.png)

Second, we need to copy both x86 and x64 versions of the assemblies to output folder
during the project's build, and the most simple way to achieve that is to use
*Copy to Output Directory* setting as shown below (first you need to add these
files to the project using *Add -> Existing Item...* option):

![Copy assemblies to output folder](/images/2016/10/any-cpu-demo-copy-to-output.png)

Once you did these changes, project build will produce a nice folder structure we need:

![Build results](/images/2016/10/any-cpu-demo-output.png)

## Conclusion
There is nothing specific about Atalasoft assemblies in this approach. We used
it successfully in different projects with different architecture-specific libraries.

For your convenience
I put this simple project on [any-cpu-demo GitHub repository](https://github.com/Atalasoft/any-cpu-demo),
so you could easily fork it there.

Cheers!
