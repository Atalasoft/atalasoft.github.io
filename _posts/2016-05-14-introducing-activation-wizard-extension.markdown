---
layout: post
title: Introducing Activation Wizard Extension
tags: [dotimage, nuget, extension, licensing]
comments: true
related: [
    "Introducing NuGet Packages"
]
---

Hi, Dmitry is here.

You certainly heard the [latest news]({% post_url 2016-05-03-introducing-nuget %})
about [public NuGet packages](https://www.nuget.org/profiles/Atalasoft) we have
just introduced for [DotImage](http://www.atalasoft.com/Products/DotImage) product. <!--more-->
While it is pretty cool by itself and I encourage you to try and play with them
(or, wait a bit for a couple of small NuGet tutorials I have up my sleeve),
you may have a number of questions about new deployment scheme, and licensing is
probably the first one among them.

Historically, Activation Wizard utility was part of main DotImage installation package.
Once DotImage is installed on developer's machine, there are a couple of options
related to activation of the product:

  - If you have not yet purchased Atalasoft DotImage, 30-day evaluation license
  can be requested from [Atalasoft web site](https://atalasoft.com)
  - If you have purchased Atalasoft DotImage or related toolkits, existing serial
  number can be activated

Now, when we have NuGet packages so close to your Visual Studio instance, it would
be a shame to ask you to download big standalone installer just to get the Activation Wizard
(you have all the assemblies you need from NuGet already, right?).

No need to worry though, it is much easier than you think! We realized pretty quickly
that we have to provide another way of toolkit activation to support lightweight and
dynamic NuGet infrastructure, so we created [DotImage Activation Wizard Visual Studio extension](https://visualstudiogallery.msdn.microsoft.com/88ff07c9-fe68-48bd-bfdc-3fbc8a0ec1db)
, that you could install from [Visual Studio Gallery](https://visualstudiogallery.msdn.microsoft.com/).

The extension supports Visual Studio 2010, 2012, 2013, and 2015 - virtually any
Visual Studio IDE you may have around you. *Extensions and Updates* Visual Studio dialog makes it even more convinient and quick:

![Activation Wizard Installation](/images/2016/05/activation-wizard-installation.png)

It is the same Activation Wizard app, but wrapped in Visual Studio extension.
You can access it right from Visual Studio, under *Tools* top level menu:

![Activation Wizard Menu Item](/images/2016/05/activation-wizard-menu.png)

It looks and feels like as its older brother and provides the same features. In fact
it is **exactly** the same code that is included into our standalone installer:

![Activation Wizard Menu](/images/2016/05/activation-wizard.png)

And, I hope, it fills the main gap in NuGet-enabled world of DotImage - you may easisly
download the product via NuGet, you can easily activate the license using Visual
Studio extension. But what if you need another artifacts that we bundled with
our standalone installer - what if you (forgive me - I know that *you*
presonally don't need such things) need some documentation or API Reference docs?

We have an answer for that as well :) Please keep reading!

Happy Activating!
