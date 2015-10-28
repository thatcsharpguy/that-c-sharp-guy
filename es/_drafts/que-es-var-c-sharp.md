---
layout: post
title:  "¿Qué es var en C#?"
date:   2015-07-11 18:31:38
author: Antonio Feregrino Bolaños
categories: c-sharp
excerpt: He decididio "matar" el blog anterior, si por casualidad llegan a blog.fferegrino.org, encontrarán que ya no es lo que era antes. He decidido dividir el contenido y si llegaron acá buscando cosas técnicas este es el lugar indicado.
lang: es
tags:
- aprende-c-sharp
---  
Como programadores hay muchas ventajas que nos otorga C#, ya sea a la hora de escribir nuestros programas o a la hora de ponerlos a funcionar. En este post les voy a hablar acerca de una de las ventajas al escribir nuestros programas, pero para eso, veamos antes este código:  
{% highlight csharp %}
var numeroElementos = 5;
var otroNumero = 5l;
var nombre = "Paquito";
var x = nombre + numeroElemento;
var y = numeroElementos + otroNumero;
{% endhighlight %}  
**¿Uhhhh?** ¿entonces qué significa `var`?  

### var  
Pues bien, la palabra reservara `var` significa que estamos dejándole al compilador la tarea de asignar un tipo a nuestras variables. Llamamos a esto *tipado implícito*, así nos quitamos de encima la tarea de escribir los tipos completos. Así pues:  

- `var numeroElementos = 5;` &#8594; `int numeroElementos = 5;`  
- `var otroNumero = 5l;` &#8594; `long otroNumero = 5l;`
- `var nombre = "Paquito";` &#8594; `string nombre = "Paquito";`  
  
Pero no solo eso, también podemos usar `var` para instanciaciones un poco más complejas

 

