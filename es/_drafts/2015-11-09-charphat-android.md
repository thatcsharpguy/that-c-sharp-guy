---
layout: post
title:  "CharpHat para Android"
date:   2015-09-11 18:31:38
author: Antonio Feregrino Bolaños
categories: blog es
excerpt: He decididio "matar" el blog anterior, si por casualidad llegan a blog.fferegrino.org, encontrarán que ya no es lo que era antes. He decidido dividir el contenido y si llegaron acá buscando cosas técnicas este es el lugar indicado.
lang: es
---
Con CharpHat toma una foto y muéstrale al mundo que te gusta C#, CharpHat te permite colocarte un birrete con mucho estilo. Ha pasado ya un buen rato desde que tuve el deseo de hacer esta aplicación para smarthpones, y es que la idea me llegó desde que comencé en el mundo de Xamarin. Pero al tener muy poca experiencia siempre había retrasado la idea. En fin, en este post te voy a explicar cómo es que hice la app con Xamarin.Forms y ayuda de los `custom renderers`.  
  
### El proyecto  
Para comenzar, el proyecto es una aplicación de Xamarin.Forms utilizando un proyecto compartido que cree desde Visual Studio. Una vez creado, nos dejará cuatro proyectos en nuestra solución, esta vez me enfocaré solamente en el proyecto de Android ya que es el que ya está desarrollado por completo. Primero, veamos el proyecto compartido:

<img src="/postimages/charphat-android/shared-capture.png" />

Para darle un poco de organización dividí el código en carpetas, están:
<ul>
		
	<li><code>Controls</code>, contiene las abstracciones de controles que se deben implementar específicamente para cada plataforma, como es el caso de <code>StickerableImage</code>, que veremos más adelante.</li>
			
	<li><code>Helpers</code>, contiene recursos que se usan en toda la aplicación, como colores o estilos.</li>
			
	<li><code>Pages</code>, contiene las páginas que se usan a lo largo de toda la app, incluyéndo <code>CameraPage</code> que debe ser implementada por nosotros para cada plataforma, que veremos más adelante.</li>
			
	<li><code>Services</code>, contiene las abstracciones de caracterísitcas que también deben ser implementadas para cada plataforma.</li>
			
	<li><code>ViewModels</code>, contiene las clases que definen la lógica de la aplicación.</li>

</ul>  
  
### CameraPage  
La funcionalidad de la aplicación depende completamente de la posibilidad de tomar fotografías para después poderlas modificar, aquí es donde la cosa se pone un poco seria, puesto que dentro de todas las bondades que nos ofrece Xamarin.Forms, no está la posibilidad de tomar fotografías con código 100% compartido. Por ello se tiene que escribir código para cada plataforma, en este caso usando Xamarin.Android, es decir, **sigue siendo código en C#**.  

#### Código  
La implementación de la cámara es completamente una implementación basada en la que hizo Pierce Boggan en su aplicación Moments. Para usar un `custom renderer`  básicamente lo que se requiere es:  
<br />
**Declarar la abastracción**, en este caso es dentro de la carpeta `Pages` del proyecto compartido, en este caso `BasePage` deriva de `ContentPage`, esto es importante ya que es una manera de indicar qué es lo que vamos a implementar en la plataforma.
{% highlight csharp %}
public class CameraPage : BasePage
{
	public CameraPage() { }
}
{% endhighlight %}  
**Implementar para cada proyecto**, para realizar esto se debe crear una clase dentro del proyecto para el cual queremos implementar el control dentro de la plataforma, a notar que CameraPage deriva de PageRenderer (e implementa ISurfaceTextureListener, pero ese ya es otro tema):
{% highlight csharp %}
public class CameraPage : PageRenderer, TextureView.ISurfaceTextureListener
{% endhighlight %}  
Dentro de esta clase, debemos sobreescribir el método `OnElementChanged`, ya que es donde se debe modificar el el control de acuerdo a nuestras necesidades, para este caso, en ese método de carga un `layout` que contiene la definición de la página en XML para Android y se añaden los manejadores de eventos. Para terminar, debemos **indicar a Xamarin.Forms** que nuestra clase derivada de `PageRenderer` debe ser usada para renderizar la página de la cámara en el dispositivo, esto se hace mediante el atributo `ExportRenderer`:
{% highlight csharp %}
[assembly: ExportRenderer(typeof(CharpHat.Pages.CameraPage), typeof(CharpHat.Droid.Pages.CameraPage))]
{% endhighlight %}    
La implementación de la cámara usa las APIs viejas de Android, y no es para nada distinto de lo que se haría para implementar una funcionalidad similar usando Java, pero en este caso estarías usando fabuloso C#.  
  
### StickerableImage  
Otra de las características que tuvo que ser implementada de manera individual para cada plataforma fue la capacidad de añadir y manipular "stickers" usando nuestros dedos. Para ello, se deben seguir los pasos anteriores, es decir:  
<br /> 
**Declarar la abstracción**
{% highlight csharp %}
public class StickerableImage : Image
{% endhighlight %}
En este caso, añadí dos propiedades que nos permitirán manipular el tamaño (`ScaleFactor`) y el ángulo (`RotationFactor`) en el código del proyecto compartido. 