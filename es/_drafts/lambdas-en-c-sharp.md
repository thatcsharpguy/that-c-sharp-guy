---
layout: post
title:  "Lambdas en C#"
date:   2015-07-2 18:31:38
author: Antonio Feregrino Bolaños
categories: c-sharp
excerpt: Post acerca de Lambdas en C#
lang: es
---
Una vez que conocemos lo que es un delegado, y lo que son Func y Action, es momento de llegar a un tema que se convierte en algo muy sencillo, además es de mis cosas favoritas en C#: Las **expresiones lambda**. Podría muchas veces resultarnos bastante engorroso tener que escribir los métodos para poder usar el delegado. 
  
Es decir, suponiendo que tenemos el método del ejemplo pasado.
{% highlight csharp %}
void RealizaOperacionSecreta(List<string> palabras, Func<string, bool> filtro)
{% endhighlight %}
Para el que escribimos un método para usarlo como filtro:
{% highlight csharp %}
public static bool SoloConU(string s)
{
	return s.StartsWith("u");
}

// ...
// Ejemplo de uso:
RealizaOperacionSecrete(palabras, SoloConU);
{% endhighlight %}
En realidad, no es necesario escribir tanto, el método ```SoloConU```, puede ser reemplazado en el código por:  
{% highlight csharp %}
RealizaOperacionSecrete(palabras, (s) => { return s.StartsWith("u"); });

// O simplemente por:
RealizaOperacionSecrete(palabras, s => s.StartsWith("u"));
{% endhighlight %}
Por definición, las expresiones lambda son "métodos anónimos para crear tipos delegados y árboles de expresión", nos enfocaremos en lo primero. Me gusta imaginar la creación de expresiones lambda como una especie mutlación de los métodos tradicionales, y es que lo podemos ver como una serie de pasos:
<ol>
	<li>Quitamos todo lo que esté antes del primer paréntesis de apertura</li>
	<li>Agregamos el operador <code>=&gt;</code></li>
	<li>... listo</li>
</ol>  
Funciona tanto para métodos con tipo de dato de retorno o para los que no lo tienen. En el fragmento anterior de...