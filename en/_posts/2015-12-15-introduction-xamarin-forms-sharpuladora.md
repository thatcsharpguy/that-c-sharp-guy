
---
layout: post
title:  "Introduction to Xamarin.Forms (Sharpuladora app)"
date:   2015-11-26 21:00:00
author: Antonio Feregrino Bolaños
categories: c-sharp
excerpt: Esta es una guía que te llevará paso a paso a crear tu primera aplicación en Xamarin.Forms.
featured_image: featured.png
lang: es
github: https://github.com/fferegrino/sharpuladora
pdfguide: https://github.com/fferegrino/sharpuladora/releases/download/p1.0.1/guia.pdf
codeguide: https://github.com/fferegrino/sharpuladora/releases/latest
tags:
- xamarin
- xamarin-forms
- guia
featured_tag: xamarin-forms
---  
Sharpuladora
=  
¿Who hasn't made a classic "Hello world!" while getting started with a new language or framework?  
  
Well, as classic as the "Hello world!" is to code a simple calculator, and for Xamarin.Forms it is not the exception. In this guide I'll show you how to use some controls to build your apps... including your very own calculator!

# How does this guide work? 
This guide uses an interactive format, it comes with code that you can test and modify as you do the exercise. The code is divided in three or four folders:  

 - **start** is the starting point, contains a solution ready to be used to work with.
 - **parts** contains each and every needed file to complete the gud¡ide, usually these are provided for you to use them as reference if you ever get stuck on something, of course you can copy the code. As this document is divided in *parts* to which a subfolder corresponds.   
 - **final** is the final result, the place we want to reach with this guide. This folder, as the last one, is included as reference, to show the result of this guide.  

As I mentioned before, this guide is divided in several parts that cover the topics you're supposed to learn while developing your app. It is probable that in each part we work on a fragment of code
 
Como se menciona antes, esta guía está dividida en varias Parts que componen los temas que se verán a lo mientras comienzas a desarrollar tu propia app. Es muy probable que en cada Part se vea una porción de Code y posteriormente se haga referencia a uno o varios archivos en los que se hace uso de lo mencionado, estos son los archivos que vas a encontrar dentro de la carpeta `parts`.  

# La Sharpuladora

## Introducción  
This guide asumes that you have a basic understanding of how Xamarin works, if you dont, I encourage you to take a look to [Getting started with Xamarin](https://developer.xamarin.com/guides/cross-platform/getting_started/). My post on [what do you need to develop in Xamarin (in spanish)](http://thatcsharpguy.com/post/xamarin-como-empiezo/) or this other about [how to go from console to mobile](http://thatcsharpguy.com/post/from-console-to-mobile/).

## Part 1 - Getting familiarized with the code  
As every IDE does, both Xamarin Studio and Visual Studio have their own ways of managing the files that make our app work. But to sumarize: these environments divide the projects per platform, so, as we want our calculator to be available in the three main mobile platforms we will have three project plus another one which is the core of the app. I wrote a post about this, if you want to knoe more check: [How is my code organized in Visual Studio?](http://thatcsharpguy.com/post/code-organization-visual-studio/).  
  
Now is time to get our hands into the code, open up the solution `Sharpuladora.sln` that is inside the `start` folder and look a the panel in the solution explorer. For this part of the guide there is no code to add but there is code to look. Go ahead and explore, browse the solution. Once you have had enough, move on to part 2.

## Part 2 - The pages
The graphic interface of the apps built with Xamarin.Forms are composed by a set of elements of type `Page`, you can build your own pages from scratch, however, Forms offers to us some pre-coded page templates that we can use to work with in our apps. You can see a full list of those template pages <a href="https://developer.xamarin.com/guides/cross-platform/xamarin-forms/controls/pages/" target="_blank">here</a>.  

The *Sharpuladora app* consists of only one page, created using a `ContenPage` since it is one of the easiest to use.  

### Part 2.1 - Creating the main page  
When it comes to create a new page, we have to decide wether we will create using pure C# code or use XAML, this time, we will use C#.  
  
Create a new folder and name it  `Pages` inside the project named  `Sharpuladora`, then create a new C# class named  `CalcPage` inside that new folder. Make your `CalcPage` derive from  `ContenPage`.  

##### Code
File: `CalcPage.cs` 

### Part 2.2 - Setting a start page    
It is always important to set a start page for our app and in the case of Xamarin.Forms it has to be specified through a property. That property is named `MainPage` and can be found in the `App` class (inside `App.cs`).  
  
In the solution inside  `sart` the property `MainPage` is set witha page created in-place, we must change that for a reference to our `CalcPage`:  
{% highlight csharp %}
MainPage = new CalcPage();
{% endhighlight %}

##### Code
File: `App.cs`

## Part 3 - The layout  
Our page acts as a container for the interface's elements, however we must add a layout to position those elements in the page. As with the pages, Forms has a set of layouts out of the box, <a href="https://developer.xamarin.com/guides/cross-platform/xamarin-forms/controls/layouts/" target="_blank">see all here</a>.  
  
### Part 3.1 - The Grid
A simple calculator does not require of a lot og thought, the buttons are sorted in rows and columns, and that seems like a job for a `Grid`.  
  
A `Grid` is made of rows and colums which in Xamarin.Forms are specified in the form of `RowDefinition`s o `ColumnDefinition`s. Look at the following code:  
  
{% highlight csharp %}
var layout = new Grid();

// Rows:
layout.RowDefinitions.Add(new RowDefinition { Height = new GridLength(2, GridUnitType.Star) });
layout.RowDefinitions.Add(new RowDefinition { Height = new GridLength(1, GridUnitType.Star) });

// Columns:
layout.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(1, GridUnitType.Star) });
layout.ColumnDefinitions.Add(new ColumnDefinition { Width = new GridLength(1, GridUnitType.Star) });
{% endhighlight %}

In the code above we create a new `Grid` called `layout` and then it gets added a pair of rows and columns. Something to notice here is that a `Width` is specified for the columns and a `Height` is specified for the rows. The fact that we use `GridUnitType.Star` (or `*`) indicates that the size of the columns will be proportional to each other.  
  
For this excerise, create a grid with rows and columns that represent the following figure:   

{% post_image grid.png "Grid" %}
  
Once we have created the layout, it is important to tell our page to use it as a content, the way to do it is by specifying the property `Content` at the end of the page's constructor with the following line of code:  

{% highlight csharp %}
Content = _layout;
{% endhighlight %}

##### Code
File: `CalcPage.cs`

## Part 4 - The interface element  
Now that the container of our elements (the layout) has been created, it is the time to create the all the interface elements.  

We will use buttons for the digits and operators as well as alaber to show the result.  

Initializing controls is pretty simple, for example, to create the button that will serve as the '0' in our calculator, we must write something like the following code:  
 
{% highlight csharp %}
_b0 = new Button { Text = "0" };
{% endhighlight %}

Once the control has been created we must add it to the containing layout to be shown in the screen. Remember that in this case the layout is made of rows and columns, so we must set a column number and column number where it must appear on the screen,
the `Grid` class allows us to set those values via the static `SetColumn` y `SetRow` methods. In the code below the first column and the fourth row are set to the button `_b0`:  
  
{% highlight csharp %}
Grid.SetColumn(_b0, 1);
Grid.SetRow(_b0, 4);
{% endhighlight %}  

Next, we add it to the layout by using this line:  
  
{% highlight csharp %}
_gridLayout.Children.Add(_b0);
{% endhighlight %}

For the label where the result will be shown, we will use the `SetColumnSpan` methods to indicate that our control that it has to span across more than one column within the layout. In this case, we are setting ca column span of 4 to the `_resultDisplay` label:  
  
{% highlight csharp %}
Grid.SetColumnSpan(_resultDisplay, 4);
{% endhighlight %}

We also can use `SetRowSpan` if we want a control to use more than one row.

##### Code
File: `CalcPage.cs`

## Part 5 - The events  
In a calculator like the one we are doing, user interaction is required and in Xamarin.Forms such interactions are handled though events. Each of the controls we have added can have one or more events that are triggered by user interactions (or any other fragment of our code)

En una calculadora como la que estamos haciendo se requiere de interacción de los usuarios y en Xamarin.Forms las interacciones son manejadas a través de eventos. Cada uno de los controles que añadimos a una página pueden tener uno o más eventos que son "lanzados" por interacciones con el usuario (o con otros elementos de nuestro programa), como programadores es necesario indicar qué eventos queremos manejar y cómo los vamos a manejar.  
  
Para nuestra calculadora vamos a manejar el evento `Clicked` de los botones, dicho evento es lanzado cada vez que el usuario da "click" sobre el botón. Manejar eventos es cosa sencilla en C#, lo que tenemos que hacer es asignar (con el operador `+=`) un manejador al evento del control que deseamos. En el siguiente fragmento de Code se especifica un manejador para el evento `Clicked` de `_b0`:  
{% highlight csharp %}
_b0.Clicked += OnNumericButtonClicked;
{% endhighlight %}

El manejador `OnNumericButtonClicked` no es más que un método que tiene como tipo de retorno `void` y recibe dos argumentos:  

 - `object sender` que es una referencia al control que lanzó el evento
 - `EventArgs e` que son algunos argumentos extra sobre el evento lanzado 

Como ejemplo acá abajo está la implementación del método para los botones del teclado numérico de nuestra calculadora. En la primera línea se ase un *cast* de `sender` a `Button` lo cual es válido porque como comenté: en `sender` viene el control que lanzó el evento.   
{% highlight csharp %}
void OnNumericButtonClicked(object sender, EventArgs e)
{
	Button botonClickeado = (Button)sender;
	if (primerNumero == null || primerNumero == "")
	{
		primerNumero = botonClickeado.Text;
	}
	else
	{
		segundoNumero = botonClickeado.Text;
	}
}
{% endhighlight %}

Los manejadores pueden ser compartidos entre muchos controles, así que no tienes que crear un manejador para cada control que uses en tu aplicación. Así que ahora es tu turno de crear toda la lógica de la calculadora usando los controles y los manejadores de eventos. Si te encuentras un poco perdido puedes echarle un ojo al archivo que te indico más abajo para comenzar.

##### Code
Archivo `CalcPage.cs`

## Part 6 - Un pequeño truco  
Podrás pensar que nuestra calculadora está (casi) terminada, pero no. Si la echas a andar a como la tenemos hasta ahora te darás cuenta que la calculadora no ocupa la pantalla entera... un pequeño bug. Para resolverlo haremos uso de otro tipo de *layout* que envuelva a nuestro *layout* original. Para la ocasión haremos uso de un `RelativeLayout` que nos permite mayor flexibilidad a la hora de controlar cómo se muestran los elementos y por ende, requiere de mayor configuración. Reemplaza la asignación `Content = _layout;` por el siguiente fragmento de Code:  
{% highlight csharp %}
// Trick to make our calculater fullscreen
var relativeLayout = new RelativeLayout();
relativeLayout.Children.Add(_layout, // <= Original layout
	Constraint.Constant(0),
	Constraint.Constant(0),
	Constraint.RelativeToParent(p => p.Width),
	Constraint.RelativeToParent(p => p.Height));
Content = relativeLayout;
{% endhighlight %}

# Siguientes pasos  
Como probablemente te habrás dado cuenta, la aplicación no está completa, le falta implementar algunos manejadores y toda la lógica de la calculadora.  Esa es tu misión, si decides aceptarla.  

Recuerda que si llegas a tener dudas sobre lo visto en esta guía puedes contactarme vía [correo](mailto:feregrino@thatcsharpguy) o [Twitter](https://twitter.com/io_exception). 

# Reto  
Si vives en el DF y me envías una versión de la calculadora completa a feregrino@thatcsharpguy.com puedes ganarte una copia física del libro Creating Mobile Apps with Xamarin.Forms Book Preview 2 de Charles Petzold, tengo varias para regalar además de otras cuantas cosas de Xamarin. Así que ya sabes, envíame tu calculadora terminada, no importa si está totalmente basada en el ejercicio de esta guía.

PD: Si no te aguantas las ganas de tener el libro, puedes <a href=" https://developer.xamarin.com/guides/cross-platform/xamarin-forms/creating-mobile-apps-xamarin-forms/" target="_blank">descargar el e-book</a>.
