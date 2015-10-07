---
layout: post
title: ¿Cómo empiezo con Xamarin?
date:   2015-07-17 18:31:38
author: Antonio Feregrino Bolaños
categories: c#
excerpt: Para un proyecto Instrumentación en la escuela decidí desempolvar mi Netduino Plus 2, en el proyecto decesitábamos mostrar las mediciones de tres distintos sensores en un par de displays de 7 segmentos.
lang: es
---  
¿Te invitaron a un evento de Xamarin y no sabes por donde empezar? Acá te digo.

# Hardware  
Para empezar, la primera duda es respecto al hardware. Me basaré en los requerimientos (no oficiales) mínimos para desarrollar y publicar apps para las tres plataformas móviles (iOS, Android y Windows) y a pesar de que algunos de los requerimientos en hardware tienen mucho que ver con los emuladores de dispositivos no puden pasar desapercibidos.  

## Dispositivos
No necesitas tener el dispositivos físicos para la mayor parte de desarrollo de las apps, para ello tenemos los emuladores ;). Pero, si lo que quieres es que tu producto final tenga mejor calidad, definitivamente debes tratar de conseguir un dispositivo de la plataforma que vas a desarrollar. Nunca está de más.  

## Mac o PC
Deberás tener una Mac **y** una PC disponibles. Sí, las dos. Si únicamente tienes Mac, podrás desarrollar aplicaciones para Android e iOS solamente. Si solo tienes una PC podrás desarrollar para Android y Windows Phone.
### Siendo más específico
 - **Procesador**: para usar el emulador de Windows Phone en una PC es necesario un procesador de 64 bits que soporte Hyper-V y para usar los emuladores de iOS en una Mac es necesario un procesador Intel. 
 - **RAM**: No voy a mentir, los entornos de programación que se usan así como los emuladores tienden a consumir muchos recursos al momento de compilar o depurar, así que diría que necesitas al menos 4 Gb de memoria, cualquier otra cosa únicamente te provocará muchas frustraciones.  


# Software
Una vez que tenemos el hardware, es necesario hablar del software, vamos por plataformas.  

## PC
### Windows
Necesitas Windows 8 Pro o superior pero **si no estás interesado en** desarrollo para **WP 8** puedes usar Windows 7 sin problema.
### IDE
Si estas usando una PC como dispositivo principal de desarrollo, puedes usar como entorno de programación…
- *Visual Studio* cualquier versión profesional o superior del 2010 en adelante funcionará. Y ahora también puedes utilizar la versión *Community*.
- *Xamarin Studio* este IDE siempre se instala junto con Xamarin y es gratuito, en él no puedes crear aplicaciones para Windows Phone.  
