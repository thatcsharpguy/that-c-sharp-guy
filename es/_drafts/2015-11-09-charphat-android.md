---
layout: post
title:  "CharpHat para Android"
date:   2015-09-11 18:31:38
author: Antonio Feregrino Bolaños
categories: blog es
excerpt: He decididio "matar" el blog anterior, si por casualidad llegan a blog.fferegrino.org, encontrarán que ya no es lo que era antes. He decidido dividir el contenido y si llegaron acá buscando cosas técnicas este es el lugar indicado.
lang: es
---
Ha pasado ya un buen rato desde que tuve el deseo de hacer esta aplicación para smarthpones, y es que la idea me llegó desde que comencé en el mundo de Xamarin. Pero al tener muy poca experiencia siempre había retrasado la idea. En fin, en este post te voy a explicar cómo es que hice la app con Xamarin.Forms y mucha ayuda de los `custom renderers`.  
  
### El proyecto  
Para comenzar, el proyecto es una aplicación de Xamarin.Forms utilizando un proyecto compartido que cree desde Visual Studio. Una vez creado, nos dejará cuatro proyectos en nuestra solución, esta vez me enfocaré solamente en el proyecto de Android ya que es el que ya está desarrollado por completo. Primero, veamos el proyecto compartido:

<div class="pure-g">
    <div class="pure-u-8-24">
	<img src="/postimages/charphat-android/shared-capture.png" />
	</div>
    <div class="pure-u-16-24">
{% highlight csharp %}
a => a.ToString()
{% endhighlight %}
	</div>
</div>  