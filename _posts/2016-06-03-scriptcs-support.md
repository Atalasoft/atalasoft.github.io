---
layout: "post"
title: "ScriptCs support for DotImage"
date: "2016-06-03 03:09"
tags: [dotimage, nuget, scriptcs]
comments: true
related: [
    "Introducing NuGet Packages"
]
---
Hi, Dmitry is here.

It is interesting and very motivating to discover more and more features that we can
utilize after we created NuGet packages for DotImage product. It is like a good
investment - you get more and more dividends over time :)

Recently I discovered another cool area where NuGet packages are especially useful - scripting.

## The issue
It turned out that I repeat the same routine steps over and over, almost every day
when I work with the product or try to reproduce an issue:

 - Open fresh Visual Studio instance (I usually have a couple VS instances open already
   with large solutions - it is a waste of time to close them)
 - Create new console application project (at the end I constantly have a bunch of
   *ConsoleApplication{N}* folders in my working folder - that annoys me a lot; you may
   say it is a lack of discipline and I would agree, but I know that many people
   have the same problem)
 - Remove *Class1.cs* (how many times did you do this?)
 - Add a bunch of references to the assemblies I'm going to use (now, with NuGet
   packages it is much easier, but still requires some work)
 - Import a number of commonly used namespaces
 - Write some code (finally!)

Usually I need to write pretty trivial code to reproduce the issue or to play
with particular image. I hate to spend so much time for preparation work.

## Solution
And I don't have to do all this after all! Recently I stumbled upon a project that offers a huge
productivity gain for the kind of workflow I described above - [**scriptcs**](http://scriptcs.net).

*scriptcs* is a full featured [REPL](https://en.wikipedia.org/wiki/Read–eval–print_loop)
for C# language. You may write your scripts, reference assemblies, consume NuGet packages,
all without running Visual Studio instance! It means that I can bring my console
window forward and start hacking right away!

[Scriptcs home page](http://scriptcs.net) has a great tutorial to let you start
quickly and painlessly. You will be able to run the REPL or run your scripts in
your text editor of choice in minutes. However, you may miss some Visual Studio
features, like IntelliSense and warnings. Good news is that you can use
[OmniSharp](http://www.omnisharp.net) with your [favorite text editor](http://www.omnisharp.net/#integrations)
to get almost all features you may expect from modern IDE in terms of code writing experience.

![Atom with scriptcs support](/images/2016/06/scriptcs-editor.png)

## Motivating example
Ok, I spent so much time telling you all this, let's do some coding!

I'm going to show you a basic example of scriptcs script (sorry) that helps to solve
common imaging problem that arise again and again - splitting multipage TIFF file
into single page ones (honestly, it is one of the most common basic imaging operations
that everyone want to perform at some point).

To start our journey into scripting world, we need to create new folder for the script
and install DotImage NuGet packages we are going to use:

{% highlight shell %}
scriptcs -Install Atalasoft.dotImage.x64
{% endhighlight %}

![scriptcs package installation](/images/2016/06/scriptcs-install-package.png)

Once we did that, scriptcs created *scriptcs_packages.config* file which contains
the list of packages you use in your script. Conceptually, it is the same old NuGet
*packages.config* friend that you can distribute this file along with your script
to restore all the packages.

Next step is the script itself. I started with empty *splitTiff.csx* file with
the following code:

{% highlight csharp %}

using Atalasoft.Imaging;
using Atalasoft.Imaging.Codec.Tiff;

// Env class allow to get access to script arguments
var fileNameToSplit = Env.ScriptArgs[0];
var outputFolder = Env.ScriptArgs[1];

using (var file = File.OpenRead(fileNameToSplit))
{
    // open TIFF file
    var multipageTiff = new TiffDocument(file);
    var pageCount = multipageTiff.Pages.Count;

    // iterate over pages...
    for (var i = 0; i < pageCount; ++i)
    {
        var tiff = new TiffDocument()
        {
            Pages = { multipageTiff.Pages[i] }
        };
        var fileName = Path.Combine(outputFolder, string.Format("{0}.tif", i));
        tiff.Save(fileName);
    }
}
{% endhighlight %}

Simple, huh? The code is trivial, but there are several items to note:

 - no *Program* class or *Main* method - you can write your code right away!
 - script arguments can be accessed using *Env.ScriptArgs* array

To run the script from command line, you need to use the following command:

{% highlight shell %}
scriptcs splitTiff.csx -- <file to split> <output folder>
{% endhighlight %}

Here is an example run I did (with additional logging statements I omitted above):
![scriptcs package installation](/images/2016/06/scriptcs-execution.png)

The only thing to note here is "--" sequence you need to use to differentiate
scriptcs arguments from arguments you want to pass into your script.

## Conclusion
Overall, I'm pretty happy with this solution. It is easy to use, fast and concise.
I use small disposable scripts to write sample programs, reproduce issues
and play with the code in general. It is great to finally have full featured REPL for
C# and be able to consume all the goodies that NuGet provides.

I encourage you to check it out and keep an eye on
[scriptcs-dotimage](https://github.com/Atalasoft/scriptcs-dotimage) GitHub repo
where I'm going to keep sample scripts to demonstrate the possibilities of
scripting with DotImage. More importantly, we plan to work on
[Script Pack](https://github.com/scriptcs/scriptcs/wiki/Script-Packs) for
DotImage to simplify scripting even more. Stay tuned, I'm planning to get back
to this topic pretty soon!
