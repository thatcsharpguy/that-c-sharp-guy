---
layout: post
title: Tipos nullables en C#
date:   2015-07-17 18:31:38
author: Antonio Feregrino Bolaños
categories: c#
excerpt: Para un proyecto Instrumentación en la escuela decidí desempolvar mi Netduino Plus 2, en el proyecto decesitábamos mostrar las mediciones de tres distintos sensores en un par de displays de 7 segmentos.
lang: es
---
En un post anterior hablaba acerca de los tipos de dato en C#, y me doy cuenta que se me olvidó mencionar una característica importante de los tipos de dato, y para rectificar mi error voy a tomar la clasificación por referencia y valor de la que les platicaba.  

## Apuntando a la nada  
  
Los tipos por referencia son *nullables* por definición. ¿Qué implica que sean *nullables*? pues nada más y nada menos que puedan tener un valor `null` o en términos prácticos, nungún valor. Esto se puede explicar desde el nombre mismo, al ser referencias estas **pueden estar referenciando a un valor o a la nada** (a `null`).

Podemos usar esto a nuestro favor para implementar la lógica de nuestras aplicaciones: Supongamos que tenemos un método `BuscaPersona` que buscará en la base de datos a cierta persona por su nombre, dicho método regresa una instancia de la clase `Persona` 

Por otro lado, los **tipos por valor siempre tienen un valor** (valga la redundancia) asignado. Es así que un `int`, `bool`, `double`, etcétera nunca podrán valer *null*. Y es que estos no hacen referencia a ningún valor, sino que son el valor mismo.  
  
Muchas veces esta limitante nos lleva a inventarnos *números mágicos* como por ejemplo usar el <code>-1</code> para decir que un entero no tiene valor, o lógicas extrañas dentro de nuestro programa como decir que si un `DateTime` vale `DateTime.MinValue` es porque no tiene valor.  También nos complica un poco la vida cuando se trabaja con bases de datos en donde los datos pueden tener un valor o estar indefinidos.
  
Para nuestra fortuna, C# nos ofrece los *nullable types*, que son instancias de la estructura `Nullable<T>` (si no estás familiarizado con la sintaxis `<>` pronto la explicaré en un post, es maravillosa), donde `T` es un tipo por valor.  
  
## La estructura Nullable<T>
Podemos ver esta estructura como una especie de caja para nuestros tipos por valor, dicha caja provee métodos para saber si contiene un valor y obtener el valor que contiene.

imagen de una caja xD  


### Trabajando con Nullable<T>
La sintaxis de estos tipos no es muy complicada, y es que además de la declaración convencional:  
{% highlight csharp %}
Nullable<int> enteroNullable = null;
Nullable<double> puedeValerNull = null;
{% endhighlight %}
También podemos usar el símbolo (<code>?</code>) símbolo en la declaración de la variable para indicar que se trata de un tipo nullable:  
{% highlight csharp %}
int? enteroNullable = null;
double? puedeValerNull = null;
{% endhighlight %}

