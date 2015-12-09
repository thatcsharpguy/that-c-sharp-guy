---
layout: page
title: MrkViewer
permalink: /mrkviewer/
lang: en
---    
MkrViewer is a simple yet powerful markdown viewer mobile (and desktop) platforms. 

Markdown leverages all the capabilities provided by the CommonMark specification which is used in many other applications across the web.  

**This is only a viewer** no plans for editing features in the near future.  
  
### But why?  
Some time ago I bought a cheap Microsoft Surface RT that ended up not being so useful (we can all agree that Windows RT isn't the best OS, right?), I didn't wanted to keep collecting dust with it so I decided to turn it into a markdown reader.  
  
I tried several apps (even some paid ones) but no one convinced me, that's when I opened Visual Studio and started this app.

### Tech stuff 
This app is built using Xamarin.Forms even though the "viewer" is implemented using a `WebView` control where the converted Markdown is rendered.  

Speaking of markdown-to-html conversion, the CommonMark implementation for C# is provided by [CommonMark.NET](https://github.com/Knagis/CommonMark.NET).  

### Support, bugs and feature requests
First of all, if you are here to give feedback, I want to thank you for using MrkViewer and for helping me to improve this app, that being said:  

Please use the <a href="https://github.com/fferegrino/MrkViewer/issues/new" target="_blank">issues system</a> on GitHub to report any bug or request features.  
	