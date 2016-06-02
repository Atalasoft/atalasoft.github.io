---
layout: post
title: Introducing NuGet Packages
tags: [dotimage, nuget]
comments: true
published: true
related: [
    "Introducing Activation Wizard Extension"
]
---

Hi, Dmitry is here.

Yes, you read it right. [Atalasoft DotImage NuGet packages](https://www.nuget.org/profiles/Atalasoft)
are officially online!

We worked pretty hard for about a year to deliver this update. It is the fist step
in our much bigger plan to refresh the product, make it more accessible to our
customers. And - most importantly for us, developers - make it easier to update
and "funner" to work with.

[DotImage](https://www.atalasoft.com/Products/DotImage) is a big product,
with a bunch of assemblies that provide [different functionality](http://www.atalasoft.com/Technical-Details/net-technical).
Not all our customers need [Dicom decoder](http://www.atalasoft.com/Technical-Details/net-technical?s=35) or
[Barcode Writer](http://www.atalasoft.com/Technical-Details/net-technical?s=12) module though.
It is natural to split the product into independent pieces that could be used only when required.
NuGet allows us to do just that - we split all our assemblies into a series of
NuGet packages that could be independently installed and, best of all,
all required dependencies will be installed as well. It is a big win - no need
to think whether you need to deploy particular assembly with your application or not -
just leave it to us - we carefully specified all inter-assembly dependencies in
NuGet package definitions.

You may be curious to see dependency graph of our packages... Well, it is pretty easy
to accomplish:

![NuGet Package Dependencies](/assets/nuget_dependencies.png)

With NuGet infrastructure in place, creation of new imaging project is a breathe.
All you need is to download the packages you want and drop some code into the pot!

We provide two flavors of each package - x86 and x64 (there are rare exceptions though -
[ISIS scanning package](https://www.nuget.org/packages/Atalasoft.dotImage.Isis.x86/)
is x86 only, there is not x64 version). More than that, each package contains binaries
built for .NET Framework 2.0 and .NET Framework 4.0, which make it possible to target
virtually any .NET version you use in your project.

It all sounds complex, but in reality you rarely need to think about this - it is
enough to add to x86 / x64 package - NuGet and Visual Studio handle
.NET version automatically and add a reference to correct version of the assembly.

We will be posting a lot of content about NuGet usage, along with a number of tutorials
and best practices. This post is just an introduction to the new distribution channel
DotImage now supports.
