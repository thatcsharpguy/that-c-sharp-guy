---
layout: post
title:  "Lambdas en C#"
date:   2015-07-2 18:31:38
author: Antonio Feregrino Bolaños
categories: c-sharp
excerpt: Post acerca de Lambdas en C#
lang: es
---
De entre las muchas herramientas que provee C# hay una que me parece de las más útiles que posee, esta herramenta se llama Expresiones Lambda (que de ahora en adelante llamaré simplemente "lambdas"), en este post trataré de explicarlas. Pero para que se den una idea, comenzaré por presentarles uno de los ejemplos de lo que se puede hacer con el uso de las lambdas:
<div class="pure-g">
    <div class="pure-u-1-2">
{% highlight csharp %}
// Sin lambdas
int contador;
public App()
{
	var botonConsulta = new Button();
	botonConsulta.Clicked += BotonConsulta_Clicked;
}
// A lot of more code ...
public void BotonConsulta_Clicked(object sender, EventArgs e)
{
	contador++;
}
{% endhighlight %}
	</div>
    <div class="pure-u-1-2">
{% highlight csharp %}
// Con lambdas
int contador;
public App()
{
	var botonConsulta = new Button();
	botonConsulta.Clicked += (s, e) => {
		contador++;
	};
}
{% endhighlight %}
	</div>
</div>
Como se puede ver en el ejemplo anterior, hay una diferencia significativa en cuanto a la legibilidad de nuestro código la cual es más notable en cuanto la cantidad de este aumenta.
