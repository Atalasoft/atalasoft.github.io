---
layout: "post"
title: "ScriptCs support"
date: "2016-05-22 11:11"
tags: [dotimage, nuget, scriptcs]
comments: true
related: [
    "Introducing NuGet Packages"
]
---

Hi, Dmitry is here.

It is interesting and very motivating to discover more and more features that we can
utilize after we created NuGet packages for DotImage product. It is like a good
investment - you get more and more divedents over time :)

Recently I discovered another cool area where NuGet packages are especially useful - scripting.

## The issue
It turned out that I repeat the same routine steps over and over, almost every day
when I work with the product or try to reproduce an issue:

 - Open fresh Visual Studio instance (I usually have a couple VS instances open already
   with large solutions - it is a waste of time to close them.)
 - Create new console application project (at the end I constantly have a bunch of
   *ConsoleApplication{N}* folders in my working folder - that annoys me a lot; you may
   say it is a lack of discipline and I would agree, but I know that many people
   have the same problem)
 - Remove *Class1.cs* (how many times you did this?)
 - Add a bunch of references to the assemblies I'm going to use (now, with NuGet
   packages it is much easier, but still requires some work)
 - Import a number of commonly used namespaces
 - Write some code (finally!)

Usually I need to write pretty trivial code to reproduce the issue or to play
with particular image. I hate to spend so much time for preparation work.

## Solution
And I don't have to after all! Recently I stumbled upon a project that offers a huge
productivity gain for the kind of workflow I discribed above - [scriptcs](http://scriptcs.net).

Scriptcs is a full featured [REPL](https://en.wikipedia.org/wiki/Read–eval–print_loop)
for C# language. You may write your scripts, reference assemblies, consume NuGet packages,
all without running Visual Studio instance! It means that I can bring my console
window forward and start hacking right away!

[Scriptcs home page](http://scriptcs.net) has a great tutorial to let you start
quickly and painlessly. You will be able to run the REPL or run your scripts in
your text editor of choice in minutes. However, you may miss some Visual Studio
features, like IntelliSense and warnings. Good news is that you can use
[OmniSharp](http://www.omnisharp.net) with your [favourite text editor](http://www.omnisharp.net/#integrations)
to get almost all you may expect from modern IDE in terms of code writing experience.

## Concrete example
