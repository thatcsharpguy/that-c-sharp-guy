---
layout: post
title: Arreglos en C# (multidimensionales rectangulares)
date: 2015-10-23 22:00:00
author: Antonio Feregrino Bolaños
categories: aprende-csharp
excerpt: Para la mayoría de sus aplicaciones, C# es un lenguaje fuertemente tipado, en este post presento dos categorías de tipos que nos podemos encontrar cuando trabajamos con este lenguaje.
lang: es
featured_image: featured.png
tags:
- aprende-c-sharp
---  
Después de conocer los <a href="/post/arreglos-en-c-sharp-parte-2">arreglos multidimensionales escalonados</a> esta vez toca el turno de conocer otro tipo de arrelgos multidimensionales en C#: Los rectangulares. En pocas palabras podríamos decir que estos no son "arreglos de arreglos", sino que en realidad son matrices dado que no es posible declarar arreglos dentro de ellos como con los escalonados.  
  
#### Instanciación  
Para crear un arreglo haremos uso de la palabra reservada `new` y los corchetes cuadrados `[ ]` pero ojo que aquí se introduce una nueva notación, para separar las dimensiones de nuestra matriz no debemos usar `[ ]` consecutivamente, sino emplear una coma `,` dentro de ellos.
{% highlight csharp %}
char [,] gato = new char[3,3];

int [,,] rubik = new int[3,3,3];
{% endhighlight %}  

<br />  
Además de la instanciación tradicional, también podemos emplear la instanciación de colecciones, la cual nos permite inicializar un arreglo asignándole valores inmediatamente:  
{% highlight csharp %}
char [] vocales = new char[5] { 'a', 'e', 'i', 'o', 'u' };

int [] conteo = new int[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 0 };

object [] misObjetos = { "3", 1, 99.99 };
{% endhighlight %}
Como podemos ver, tenemos varias opciones para inicializar arreglos unidimensionales:  

1. `new char[5] { ...`, nos permite indicar el tamaño y el tipo explícitamente y posteriormente indicar los valores, si cambiáramos el `5` por un `7`sin aumentar la cantidad de valores obtendríamos un error de compilación.  
2. `new int[] { 1, 2, ...`, nos permite indicar solamente el tipo de dato, la cantidad es inferida por el compilador, en este caso podemos incrementar o reducir la cantidad de elementos al momento de inicializar sin ningún problema.
3. `{ "3", 1, 99.99 }`, al inicializar de esta manera estamos dejandole al compilador la tarea de inferir tanto el tipo de dato del arreglo como la cantidad de elementos que contiene. Dicho sea de paso, el declarar un arreglo así puede resultar un poco confuso de leer.  

#### Acceso a los elementos  
Una vez instanciado, podemos acceder a los elementos del arreglo usando nuevamente los corchetes cuadrados `[ ]` y el índice del elemento al que queremos acceder. Nota importante **los arreglos están indizados en 0** es decir, el primer elemento de un arreglo está en el índice 0.  

Retomemos los arreglos del ejemplo pasado. Para acceder a la `a` dentro del arreglo `vocales` debemos acceder a la posición `0`:  
{% highlight csharp %}
Console.WriteLine(vocales[0]); // a
{% endhighlight %}
O, digamos que queremos reemplazar la `i` por una `t`:  
{% highlight csharp %}
vocales[2] = 't';
Console.WriteLine(vocales[2]); // t
{% endhighlight %}  

#### Propiedades y métodos  
A pesar de que los arreglos implementan la interfaz `IList`, con todo y sus propiedades, la única rescatable para los arreglos unidimensionales es la propiedad `Length`, que nos devuelve la longitud del arreglo:
{% highlight csharp %}
Console.WriteLine(vocales.Length); // 5

Console.WriteLine(conteo.Length); // 10

Console.WriteLine(misObjetos.Length); // 3
{% endhighlight %} 
  
### Multidimensionales escalonados
Los arreglos escalonados (o *jagged arrays*) son los tipos de arreglos multidimensionales más conocidos, y es que también son compunes en otros lenguajes de programación. Un arreglo escalonado no es más que un arreglo de arreglos.

#### Instanciación  
Para crear estos arreglos de arreglos, tenemos una sintaxis similar a la creación de arreglos unidimensionales, con `[ ]` para cada dimensión: 
{% highlight csharp %}			
char[][] gato = new char[3][];

string [][][] rubik = new string[3][][];

int[][] escalera = new int[3][];
{% endhighlight %}  
Acá es importante notar que al instanciar un arraglo multidimensional de esta manera **únicamente estamos indicando el tamaño de la primera dimensión**, 3 en el caso de `gato`, 3 también para `rubik` y 2 para `escalera`. Es tarea nuestra inicializar los arreglos interiores: 
{% highlight csharp %}			
for(int i = 0; i < 3; i++)
{
	gato[i] = new char[3]; // gato[i] hace referencia a un arreglo
}
{% endhighlight %}   
{% highlight csharp %}			
for(int i = 0; i < 3; i++)
{
	rubik[i] = new string[3][];
	for(int j = 0; j < 3; j++)
	{
		rubik[i][j] = new string[3];
	}
}
{% endhighlight %}  
Con los arreglos escalonados no hay nada que nos prohíba crear arreglos internos de dimensiones iguales a la de arreglo que las contiene, es más, **podemos crear arreglos internos de distintos tamaños**, hagamos algo con nuestro arreglo `escalera`:   
{% highlight csharp %}			
escalera [0] = new int[1] { 1 };
escalera [1] = new int[2] { 2, 3 };
escalera [2] = new int[3] { 4, 5, 6 };
{% endhighlight %}  
