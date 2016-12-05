% Habits
% John Doe
% March 22, 2005
<style>
body{
    background-image: url('image.png');
    background-color: #6DB3F2;
    background-size: 1350px 600px;
                        }
</style>
<style>
.myTable { 
  width: 100%;
  text-align: left;
  background-color: lemonchiffon;
  border-collapse: collapse; 
  }
.myTable th { 
  background-color: goldenrod;
  color: white; 
  }
.myTable td, 
.myTable th { 
  padding: 10px;
  border: 1px solid goldenrod; 
  }
</style>

# In the morning

## Getting up

- Turn off alarm
- Get out of bed

## Breakfast

- Eat eggs
- Drink coffee

# In the evening

# Dinner

- Eat spaghetti
- Drink wine
- <center><IMG src="image.jpeg" width="600" height="400"/></center> 

------------------


# Going to sleep

- Get in bed
- Count sheep
* To produce the slide show, simply type

* pandoc -t s5 -s habits.txt -o habits.html
for S5,

* pandoc -t slidy -s habits.txt -o habits.html
for Slidy,

* pandoc -t slideous -s habits.txt -o habits.html
for Slideous,

* pandoc -t dzslides -s habits.txt -o habits.html
for DZSlides, 
                     
* * *


# Going to Math

*  Definición: Sea $X$ una variable aleatoria que asume los valores $x_{1},x_{2},x_{3},\cdots x_{k}$, con iguales probabilidades, entonces       $$ \begin{equation} f\left(x,k\right)=\left\{ \begin{array}{ccc}\frac{1}{k} & si & x=x_{1},x_{2},x_{3},\cdots x_{k}\\ 0 &  & \text{si no} \end{array}\right.\end{equation}$$

* * *


 
 
#Other Maths
* These render differently. For example, type $\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}$
 * (which is inline mode) or type
* $$\begin{equation}\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}\end{equation}$$

* En una línea  $\alpha + \beta -x^2 = \frac{1}{2^{-32} - 1}$ o $x^{2} + y^2 = z^2$


# Going Code
* Math online
```tex
En una línea  $\alpha + \beta -x^2 = \frac{1}{2^{-32} - 1}$ o $x^{2} + y^2 = z^2$
```
* Math display
```tex
$$\begin{equation}\sum_{i=0}^n i^2 = \frac{(n^2+n)(2n+1)}{6}\end{equation}$$
```


# Going Table


Colons can be used to align columns.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |


* * * * 


Markdown | Less | Pretty
--- | --- | ---
*Still* | `renders` | **nicely**
1 | 2 | 3



* * * 
|  aaa  	| aaa   	| $\alpha$ 	| sss   	| ssss  	|
|:-----:	|:-------	|----------:	|-------	|-------	|
| ssss  	| ss   	| aaaa     	| 11 	| 4444  	|
| 33333 	| 2222  	| 1111     	| 11111 	| 1111  	|
|  111  	| 77777 	| 8888     	| 00000 	| sssss 	|

```
|  aaa  	| aaa   	| $\alpha$ 	| sss   	| ssss  	|
|:-----:	|:-------	|----------:	|-------	|-------	|
| ssss  	| ss   	| aaaa     	| 11 	| 4444  	|
| 33333 	| 2222  	| 1111     	| 11111 	| 1111  	|
|  111  	| 77777 	| 8888     	| 00000 	| sssss 	|
```



