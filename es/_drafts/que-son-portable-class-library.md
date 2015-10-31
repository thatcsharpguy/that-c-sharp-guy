---
layout: post
title:  "¿Qué es una Portable Class Library?"
date:   2015-11-02 10:00:00
author: Antonio Feregrino Bolaños
categories: c-sharp
excerpt: Podemos ver un delegado en C# como un tipo de dato que apunta a un método permitiéndonos así extender las capacidades de nuestro código o permitir que otros lo hagan.
lang: es
ideone: http://ideone.com/fork/sXcTgo
tags:
- aprende-c-sharp
---  
Imaginémonos esto:  

Supongamos que es nuestra tarea desarrollar una calculadora (que suma dos números) en C# para varias plataformas, entre ellas:
  
- Android (con Xamarin.Android) 
- Consola de Windows  
- Sitio Web  

Estamos de acuerdo en que son plataformas totalmente distintas, cada una tiene características que son únicas para ella y es por eso que hasta hasta hace poco tiempo, nuestra única opción para desarrollar nuestra calculadora era escribirla una vez para cada plataforma, una librería para cada uno, algo así:  
  
  
Como podemos ver, debíamos escribir el mismo código tres veces a pesar de ser el mismo lenguaje, y si en el futuro se nos ocurría llevar nuestra calculadora a Xbox tendríamos que reescribir otra vez nuestro código para dicha plataforma.  
  
### PCL  
Sin embargo todo cambió con la aparición de las PCL (**Portable** Class Library o Biblioteca de Clases Portable), que nos permiten compartir código entre distintas plataformas de `.NET`. Con ella podemos hacer algo como esto:

Y esto es gracias a que nuestra calculadora es bastante simple, para hacer el cálculo no necesitamos leer datos de consola, ni acceder al GPS del celular ni menos montar un servidor nuestra pàgina.

### Limitaciones  
Al usar una biblioteca portable estamos limitando la cantidad de características a las que vamos a tener acceso desde ella. Siempre tomando la menor cantidad de características comunes entre plataformas:

### Xamarin.Forms
Entre los diversos usos que se le pueden dar a una PCL está el de contener nuestras vistas en Xamarin.Forms.