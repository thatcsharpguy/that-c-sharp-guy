---
layout: post
title: Xamarin.Forms 2 and UWP
date: 2015-10-22 21:00:00
author: Antonio Feregrino Bolaños
categories: aprende-csharp
excerpt: Xamarin 4 has everything you need to create great mobile apps. Check out Universal Windows Platform Apps, my favorite feature.
lang: es
featured_image: featured.png
github: https://github.com/fferegrino/Xevenshtein-UWP
tags:
- aprende-c-sharp
---  

You have heard me talk about Xamarin.Forms before and you know that I'm all mobile... but what you might have missed is the fact that I'm a HUGE Windows Platform fan. This is why this new release of Xamarin has got me excited. In this release they included <a href="//developer.xamarin.com/guides/cross-platform/xamarin-forms/windows/getting-started/universal" target="_blank">support for Universal Windows Platform Apps</a> which, even though is still a preview version, it is a great advantage for us as developers. 

For this post I'll be using a very simple app that I created in the past when I wrote about [going from console to mobile](from-console-to-mobile), however, this time is all about "from mobile to Windows Platform".  
 
## How to
As I said before, this is an ongoing work, so be aware that there are some bugs and get ready to learn how is Xamarin.Forms wired and called within a platform spedific project. 

### Start from "scratch"
Feel free to download the initial source code from <a href="https://github.com/fferegrino/Xevenshtein-UWP/releases/tag/uwp-post-1" target="_blank">here</a>, extract it somewhere and open the `Xevenshtein.sln`.

Upgrade all Xamarin.Forms packages to any version above 2

Once open, add a new project 

Reference the project where the forms application is, for us, such project is the 





