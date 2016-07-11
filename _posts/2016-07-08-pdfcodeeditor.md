---
layout: "post"
title: "PdfCodeEditor"
date: "2016-07-08"
tags: [pdf, pdfcodeeditor, editor]
comments: true
---
## Introduction

Hello, my name is Dmitry Goryachev and I'm a software engineer from Atalasoft. 
Let me introduce the tool, which I created to explore and edit PDF-files – [PdfCodeEditor](https://github.com/gdv1811/PdfCodeEditor).

![Create new empty ASP.NET project](/images/2016/07/PdfCodeEditor.PNG)

PdfCodeEditor is the open-source simple text editor based on [AvalonEdit](http://avalonedit.net/) and [AvalonDock](https://avalondock.codeplex.com/) controls.

## Scenario

When I began working with PDF as a developer, I found some tools for viewing internals of PDF ([PDFXplorer](http://www.o2sol.com/pdfxplorer/overview.htm), “Browse Internal PDF Structure” in Acrobat Reader Pro DC and etc.). However, these tools do not work with damaged PDF-files. 
First time I worked with [Notepad++](https://notepad-plus-plus.org/) with HEX-plugin, but switching to HEX for viewing character offset and back is very annoying. Also after point-fixes, in some specific cases, I got broken PDF-streams due to the saving. 

For these purposes, I created PdfCodeEditor. Now it allows open damaged PDF-files, edit them and save without issues.

## Features

 * Syntax highlighting and hiding streams in regions
 * Viewing actual offset of the characters
 * Go to definition on Ctrl + left mouse/F12
 * Navigation to the next or previous offset
 * Navigation to the specified offset
 * Standard Search panel from AvalonEdit
 * Saving does not damage the PDF-streams

## Plans

 * Support [Chocolatey](https://chocolatey.org/)
 * Object-tree to simplify navigation
 * Viewing decoded streams
 * Viewing streams as HEX, Image, Text, etc.
 * Auto-updating xreftables after edit

If you are interested in contributing, join to [PdfCodeEditor on GitHub](https://github.com/gdv1811/PdfCodeEditor).
Thank you for attention, see you later!