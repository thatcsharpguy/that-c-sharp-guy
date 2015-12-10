---
layout: post
title: Receiving files in Xamarin.Forms
date: 2015-12-06 21:00:00
author: Antonio Feregrino Bolaños
excerpt: Learn how to enable your application to receive files from other apps in the same device.
lang: en
featured_image: featured.png
github: https://github.com/fferegrino/Xevenshtein-UWP
tags:
- xamarin
- xamarin-forms
featured_tag: xamarin-forms
---
Do you want your app to receive files from other applications?  

Let's set a practical example: I built a simple markdown viewer in Xamarin.Forms and what I wanted my app to do was to show up in the available options when a `.md` were about to be opened.  This is a pretty straightforward task when developing platform specific projects... but when using Xamarin.Forms you may not know where to start (I wasn't).  
  
### Starting point
First fo all, remember that **all Xamarin.Forms apps are nothing but native apps**, there is no magic regarding them. They all start in the same point wheter it is a MainActivity for Xamarin.Android, an App.xaml for Windows Phone or an AppDelegate form Xamarin.iOS and when dealing with incoming files the same applies. So, with that in mind, let's start.

## Xamarin.Forms  
Let's create a sample application that will show the name and content of the received file, just create class to hold the data, for this sample it'll only contain a `Name` and `Content` property, but you can extend it later to fit your needs. 

{% highlight csharp %}
public class IncomingFile
{
	public string Name { get; set; }
	public string Content { get; set; }
}
{% endhighlight %}

Next, create a page (in this sample `FilePage.xaml`) with two labels (for the file name and file content), give them a name and add the next method in the code behind: 

{% highlight csharp %}
public void SetIncomingFile(IncomingFile file)
{
	FileName.Text = file.Name;
	FileContent.Text = file.Content;
}
{% endhighlight %}

Then, in your Forms app starting point (generally App.cs) create a property of type IncomingFile, don't just use an autoimplemented property, create a backing field for it. Somewhat like this:
{% highlight csharp %}
private IncomingFile _incomingFile;

public IncomingFile IncomingFile
{
	get { return _incomingFile; }
	set 
	{
		_incomingFile 	= value; 
		(MainPage as FilePage).SetIncomingFile (_incomingFile);
	}
}
{% endhighlight %}

Notice how everytime the IncomingFile property is modified, the method `SetIncomingFile` of `FilePage` is called. We will be using this property to set the file from within each platform code. So, let's dive right into it.

## Windows 8.1  
I'll start with Windows 8.1, since it was my main target with MrkViewer, check the getting started on <a href="https://developer.xamarin.com/guides/cross-platform/xamarin-forms/windows/" target="_blank">how to create a Windows App</a> for more info.  
  
First of all: you must create a file association inside your application manifest, double click the `appxmanifest` file, a window will open, from there select the Declarations tab and using the dropdow list select `File Type Associations` and click add.  


<div class="pure-g">
<div class="pure-u-lg-1-3">
{% post_image appxmanifest.png "The appxmanifest file" %}
</div>
<div class="pure-u-lg-1-3">
{% post_image file-assoc.png "Add new File Type Association" %}
</div>  
</div>
<br />
After clicking `Add` a form will appear to the right, we'll keep things simple. Fill in the form the following fields:  
 - **Display name**: Markdown
 - **Name**: md
 - **File type**: .md (don't forget the leading dot)

And that's about it. Next, we'll have to get the file when our app is launched for that purpose.  
  
In Windows 8.1 different methods are called depending on what kind of event launched our app, when our app is opened as the ressult of a File Type Association, the starting poit of the app will be the `OnFileActivated` method inside the `App` class. Let's override it: 

{% highlight csharp %}
protected override void OnFileActivated(FileActivatedEventArgs e)
{
    base.OnFileActivated(e);
    // ...
{% endhighlight %}  
  
The reference to the recently opened file is inside the `FileActivatedEventArgs`, to find it use something like this:

{% highlight csharp %}
StorageFile file = null;
if (e.Files.Count == 1)
{
    file = e.Files[0] as StorageFile;
}
{% endhighlight %}  

Launching an app to receive a file is not so different than launching it normally, so afther we get the reference to the desired file, we must let the launching process continue as usually, for that copy the code inside the `OnLaunched` from `Frame rootFr...` to `if (rootF...`  and paste it after the code above.

{% highlight csharp %}
    file = e.Files[0] as StorageFile;
} //

Frame rootFrame = Window.Current.Content as Frame;
if (rootFrame == null)
{
    rootFrame = new Frame();
    rootFrame.Language = Windows.Globalization.ApplicationLanguages.Languages[0];
    rootFrame.NavigationFailed += OnNavigationFailed;

    Xamarin.Forms.Forms.Init(e); // <- DON'T FORGET TO INITIALIZE FORMS

    Window.Current.Content = rootFrame;
}
{% endhighlight %}  
  
Now all we have to do is to navigate to the generated `MainPage` passing the file as a navigation parameter:

{% highlight csharp %}            
// Pass the recently opened file ----vvvv
rootFrame.Navigate(typeof(MainPage), file);
Window.Current.Activate();
{% endhighlight %}  

As you may guess, there is still work to do inside the Windows 8 generated  `MainPage`, and that's true. We still need to get the file passed as navigation parameter. First of all, instead of calling the forms app in this way `LoadApplication(new YOUR_NAMESPACE.App());`, create a field of type `new YOUR_NAMESPACE.App`, like

{% highlight csharp %}   
FileReceiver.App _app;
{% endhighlight %}  

And then call the `LoadApplication` using that field

{% highlight csharp %}
_app = new FileReceiver.App();
LoadApplication(_app);
{% endhighlight %}  

Now the final step: override the `OnNavigatedTo` method inside the `MainPage` class, but we need to be extra careful here, since this method will be called regardless of how was the app launched, so take that in consideration:

{% highlight csharp %}
protected override async void OnNavigatedTo(NavigationEventArgs e)
{
    StorageFile storageFile = e.Parameter as StorageFile;
    if (storageFile != null)
    {
        string content = await FileIO.ReadTextAsync(storageFile);
        var incomingFile = new IncomingFile
        {
            Name = storageFile.DisplayName,
            Content = content
        };
        _app.IncomingFile = incomingFile;
    }
    base.OnNavigatedTo(e);
}
{% endhighlight %}  

<br />

## Android
As with Windows, in Android you must tell the OS that your app is ready to receive a certain kind of files, and to do so, you must edit the `AndroidManifest.xml` file. Remember that for Xamarin.Android there are two ways to work with the manifest:

 - Editing the XML
		
{% highlight xml %}
<activity  android:icon="@drawable/icon" android:label="FileReceiver"  name="Something.MainActivity">
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <data android:scheme="file" />
        <data android:mimeType="*/*" />
        <data android:pathPattern=".*\\.md" />
    </intent-filter>
</activity>
{% endhighlight %}
		
 - Using class level attributes
		
{% highlight csharp %}
[Activity(Label = "FileReceiver",
        MainLauncher = true, Icon = "@drawable/icon")]
    [IntentFilter(
        new[] { Intent.ActionView },
        Categories = new[]
        { 
            Intent.CategoryDefault,
            Intent.CategoryBrowsable,
        },
        DataScheme = "file",
        DataMimeType = "*/*",
        DataPathPattern = ".*\\.md"
    )]
{% endhighlight %}

For this sample let's take the attribute approach. Then, once the `MainActivity.cs` file is open, separate the `LoadApplication` method and the instantion of the Forms app: 

{% highlight csharp %}
var application = new App ();

LoadApplication (application);
{% endhighlight %}  

In Android, every time an app is launched to receive a file, the `OnCreate` method is executed as if it were launched manually by the user, no special method is called or something, to know if the app was launched to receive a file we'll have to look at the Activity's Intent action and type:  

{% highlight csharp %}
string action = Intent.Action;
string type = Intent.Type;

if (Intent.ActionView.Equals(action) && !String.IsNullOrEmpty(type))
{
	// This app was launched to receive a file ...
{% endhighlight %}  

After we are sure that the app was to receive a file, we can safely get an `Uri` to the file by getting the Intent data, reading it and then creating an instance of the previously defined `IncomingFile` class:  

{% highlight csharp %}
Android.Net.Uri fileUri = Intent.Data;

string fileContent = File.ReadAllText(fileUri.Path);
string fileName = fileUri.LastPathSegment;

var incomingFile = new IncomingFile { Name = fileName, Content = fileContent }; 
{% endhighlight %}  

We have finally handled a file receiving within the Xamarin.Android project, the last thing we have to do is to set the `IncomingFile` property of the Forms app, a call to `application.IncomingFile` will do the trick:  

{% highlight csharp %}
application.IncomingFile = incomingFile;
{% endhighlight %}   