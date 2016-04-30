---
layout: post
title: Introducing NuGet Packages
tags: [dotimage, nuget]
comments: true
---

Hi, Dmitry is here.

Yes, you read it right. [Atalasoft DotImage NuGet packages](https://www.nuget.org/profiles/Atalasoft)
are officially online!

We worked pretty hard for about a year to deliver this update. It is the fist step
in our much bigger plan to refresh the product, make it more accessible to our
customers. And - most importantly for us, developers - make it easier to update
and "funner" to work with.

DotImage is a big product, with a bunch of assemblies that provides different functionality.
Not all our customers need Dicom decoder or Barcode Writer module. It is natural
to split the product into independent pieces that could be used only when required.
NuGet allows us to do just that - we split all our assemblies into a series of
NuGet packages that could be independently installed and, best of all,
all requied dependencies will be installed as well. It is a big win - no need
to think whether you need to deploy particular assembly with your application or not -
just leave it to us - we carefully specified all inter-assembly dependencies in
NuGet package definitions.

You may be curious to see dependency graph of our packages... Well, it is pretty easy
to accomplish:

<div class="mermaid">
graph TD;
    Shared[Atalasoft.Shared]-->DotImage[Atalasoft.dotImage]
    Lib[Atalasoft.dotImage.Lib]-->DotImage
    Shared-->PdfDoc[Atalasoft.PdfDoc]
    DotImage-->PdfDocBridge[Atalasoft.dotImage.PdfDoc.Bridge]
    PdfDoc-->PdfDocBridge
</div>
