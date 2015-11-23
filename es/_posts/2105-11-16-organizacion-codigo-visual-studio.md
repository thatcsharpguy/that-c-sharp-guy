---
layout: post
title:  "¿Cómo organiza mi código Visual Studio?"
date:   2015-11-18 21:00:00
author: Antonio Feregrino Bolaños
featured_image: featured.jpg
categories: xamarin
excerpt: Si alguna vez has usado un IDE para desarrollar alguna aplicación tal vez te hayas preguntado cómo es que ese tipo de programas saben en dónde están los componentes para cada una de las cosas que hacen que tu app compile o funcione. 
tags:
- aprende-visual-studio
- xamarin
---
Si alguna vez has usado un IDE para desarrollar alguna aplicación tal vez te hayas preguntado cómo es que ese tipo de programas saben en dónde están los componentes para cada una de las cosas que hacen que tu app compile o funcione. En este post trataré de explicar cómo es que Xamarin y Visual Studio llevan este control.

### La "Solución"  
Tanto Visual Studio como Xamarin Studio organizan nuestro código *assets*, liberías y demás en una estructura llamada Solución (`Solution` en inlglés), todo está almacenado en un archivo que tiene una extensión `.sln`. Este archivo  que le dice al IDE en dpnde están los proyectos de nuestra aplicación, es un archivo de texto plano, que es usualmente autogenerado por el entorno que estamos empleando para desarrollar.

{% post_image solution-in-folder.png "Image of a solution file" %}

Así es como una *Solución* se ve cuando es abierta en Xamarin Studio y Visual Studio:

{% post_image sln-opened.png "Image of opened solutions" %}

Y así es como se ve el mismo archivo pero abierto en un editor de texto plano:

{% post_image sln-plain-text-explained-2.png "Image of opened solutions" %}

<dl>
<dt>1. <i>Solución</i></dt>
<dd>El archivo como tal, el nombre que vemos en el IDE es el mismo nombre del archivo más la extensión <code>sln</code>.</dd>
<dt>2. Carpeta de solución</dt>
<dd>Estas son carpetas lógicas que podemos usar para mejorar la organización de nuestro código.</dd>
<dt>3. Proyecto compartido</dt>
<dd>Un proyecto compartido... veremos más de el en un siguiente post.</dd>
<dt>4. Proyecto de C#</dt>
<dd>Un proyecto de C#, en este caso se refiere a un proyecyto de Android, en Xamarin es una convenciín usar el sufijo <code>.Droid</code> para este tipo de proyectos.</dd>
<dt>5. Proyecto de C#</dt>
<dd>Otro proyecto de C#, en este caso se refiere a un proyecyto de iOS, en Xamarin es una convenciín usar el sufijo <code>.iOS</code> para este tipo de proyectos.</dd>
</dl>


### El archivo .[algo]proj  

Como mencioné anteriormente, la *solución* lleva un control de los proyectos que componen nuestra aplicación... pero, ¿qué es exactamente un proyecto?  

Bien, pues un proyecto es una manera lógica de organizar las clases, recursos imágenes necesarias para un cierto fin, este se describe en un archivo con extensión que termina en `proj`, siendo `.csproj` para proyectos C#, `.shproj` para proyectos compartidos y, por ejemplo, otros terminan en `.vbproj`, `.jsproj`, etc.

Como puedes ver en la imagen anterior, el archivo `.sln` contiene una especie de enlaces a esos proyectos.

Estos son los proyectos de la *Free Xamarin Shirt App*:

{% post_image freeshirtappproject.png "Xamarin Free Shirt App" %}

### tl;dr
Podemos explicar cómo es que está organizado nuestro código con el siguiente diagrama: 

{% post_image Solution-diagram.jpg "Diagram of how solution works" %}
