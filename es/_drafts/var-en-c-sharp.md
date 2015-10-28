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
var sb =  new StringBuilder();
var buenEstudiante =  new Persona("Estudiante");
{% endhighlight %}  
**¿Uhhhh?** ¿entonces qué significa `var`?  

### var  
Pues bien, la palabra reservara `var` significa que estamos dejándole al compilador la tarea de asignar un tipo a nuestras variables. Llamamos a esto *tipado implícito*, así nos quitamos de encima la tarea de escribir los tipos completos. Entonces:  

- `var numeroElementos = 5;` &#8594; `int numeroElementos = 5;`  
- `var otroNumero = 5l;` &#8594; `long otroNumero = 5l;`
- `var nombre = "Paquito";` &#8594; `string nombre = "Paquito";`  
  
Pero no solo eso, también podemos usar `var` para instanciaciones un poco más complejas:  

- `nombre + numeroElementos` es `string + int` que resulta en `string`, por lo tanto tambièn pudimos haber escrito: `string x = nombre + numeroElementos;`  
- `numeroElementos + otroNumero` es `int + long` que resulta en `long`, por lo tanto también pudimos haber escrito `long y numeroElementos + otroNumero`  

Tambén podríamos pensar que `var` funciona solo para tipos primitivos del lenguaje, sin embargo no es así como lo demuestra:  

- `var buenEstudiante = new Persona("Estdiante")` en la que podemos reemplazar `var` por `Persona`, o
- `var sb = new StringBuilder();` en la que puede ser reemplazada por `StringBuilder`  
  
### Casos especiales  
Si bien es posible usar `var` para cualquier instanciación de una variable como en los casos anteriores, no es común usarla ya que a lo mucho nos está ahorrando algunas letras por cada variable. Sin embargo hay casos en los que su uso se vuelve bastante relevante y en otro caso es necesario.  
<br />
Es relevante y bastante útil el emplearla cuando estamos trabajando con Linq (Linq es un tema que merece su propio post), ya que muchas veces no es tan claro el resultado de una sentencia linq


<br />
Su uso se vuelve completamente necesario cuando estamos trabajando con tipos anónimos  


### declaraciones erroneas
var fuera del ámbito local
var asignado a nulo
### Desventajas  


### Lo que sigue  
    
  


 

