---
layout: post
title:  "Func y Action en C#"
date:   2015-07-27 13:00:00
author: Antonio Feregrino Bolaños
categories: c-sharp
excerpt: Post acerca de Func y Action en C#
lang: es
---
Hace muy poco les hablaba de los <a href="/delegados-en-c-sharp">delegados en C#</a>, aprovechando este post quisiera hablarles un poco de la utilidad de estos. Como lo mencionaba, los delegados permiten a un desarrollador "inyectar" su propio código dentro de los métodos de el código escrito  por un tercero.   
  
  
Para poner un ejemplo, imaginemos que tenemos una lista de palabras ```palabras```  y un método ```RealizaOperacionSecreta``` que realiza cierta operación *secreta* sobre esa lista de palabras y las imprime en consola. Dicho método fue escrito por un desarrollador que no conocemos, pero que fue lo suficientemente amable para permitirnos elegir sobre qué palabras se realiza la operación mediante el uso de un delegado llamado ```filtro```.
{% highlight csharp %}
public static void RealizaOperacionSecreta(List<string> palabras, Func<string, bool> filtro)
{
	foreach(string s in palabras)
	{
		if(filtro(s))
			Console.WriteLine(s.ToUpper());
		else
			Console.WriteLine(s);
	}			
}
{% endhighlight %}
#### Func
Un momento... ese NO ES UN DELEGADO... ¿o si?. En realidad sí lo es, ```Func``` es un molde para crear delegados, podemos usar ese molde para evitarnos la fatiga de declarar un delegado para cada ocasión que necesitemos uno ```Func``` hace uso de los genéricos para especificar los parámetros de entrada y el tipo de retorno del delegado. En este caso, podemos decir que: ```delegate bool Filtro(string s)``` equivale a ```Func<string, bool>```.
Para dejar un poco más claras las cosas colocaré algunos ejemplos en código:
{% highlight csharp %}
delegate int Cuenta(string a, int b); // Sería igual usar Func<string, int, int>
delegate char Separa(); // Es igual a usar Func<char>
delegate float Uhh(char a, int b, string c, double d); // Es igual a usar Func<char, int, string, double, float>
{% endhighlight %}
Siempre el último tipo de dato especificado dentro de los ```< >``` será el tipo de retorno, por eso que si solo se especifica uno, este será el tipo de retorno del método. Podemos usarlo para crear delegados con hasta 16 parámetros de entrada.
  
Volviéndo al ejemplo... Podríamos entonces hacer uso del método de la siguiente manera:
{% highlight csharp %}
public static void Main()
{
	List<string> palabras = new List<string> { "uno", "dos", "tres", "cuatro" };
	Console.WriteLine("Palabras mayores a 3 caracteres");
	RealizaOperacionSecreta(palabras, PorTamano);
	
	Console.WriteLine("Palabras que comienzan con u");
	RealizaOperacionSecreta(palabras, SoloConU);
}
public static bool PorTamano(string s)
{
	return s.Length > 3; 
}
public static bool SoloConU(string s)
{
	return s.StartsWith("u");
}
{% endhighlight %}
