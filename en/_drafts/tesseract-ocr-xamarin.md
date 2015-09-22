---
layout: post-en
title:  "Tesseract OCR in Xamarin"
date:   2015-09-23 18:31:38
author: Antonio Feregrino Bolaños
category: xamarin.forms
excerpt: I've decided to kill my old blog, if you ever visit [blog.fferegrino.org] again you'll find that it isn't what it used to be. I decided to divide the content and if you came here looking for technical stuff, this is the right place.
---  
While surfing the web for a free / open source solution to a certain OCR problem that I came across I found this pretty cool library named Tesseract OCR which, in its own words, is: *"probably the most accurate open source OCR engine available"*. Along with the library (written in C/C++) there are an entire world of wrappers, including some for Xamarin... so, why not?  
<br />

### Application
In this post I'll show you how to create a simple iOS and Android application that allows the user to take a picture and identify the characters that got captured on the picture. Nothing too complicated. It'll be a Xamarin.Forms app, code sharing at its best!  

#### Creating the solution  
For this post I used Xamarin Studio on a Mac, but as you know, you can create it regardless of the OS or IDE. Go to New solution > Cross-platform > App > Blank Xamarin.Forms app. Give it any name you want and select Use Portable Class Library.

{% post_image project-creation-1.png Creación del proyecto %}  
 
{% post_image project-creation-2.png Creación del proyecto %}  

#### NuGets and NuGets
Then proceed to add the XLabs NuGet package (<code>XLabs.Forms</code>) to the three projects, we'll use the IoC features that it provides and the ability to take photos right from our PCL. Add also the TinyIoC package (<code>XLabs.IoC.TinyIoC</code>) to both the iOS and Android projects, I'm using TinyIoC but you can use whatever DI tool you want.  
  
#### The Tesseract NuGet 
Yay! another NuGet, but this time is the most important for our app. Add the package <code>Xamarin.Tesseract</code> to the three projects, yes, the same package for all three. This little package is <a href="http://shamsutdinov.net/2015/07/01/tesseract-orc-xamarin-part-1/" target="_blank">xxºdeveloped by Artur Shamsutdinov</a> and it is a wrapper for Tesseract OCR that provides a nice API to work with. So far so good.  

#### Platform specific code  
Now with everything else in its place, it is time to work a bit on each platofmr project. Let's start with Android
