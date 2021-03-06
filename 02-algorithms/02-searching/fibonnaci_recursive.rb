n = 0 (base case) |	fib(n-2) = "-"	  | fib(n-1) = "-"	  | fib(n) = 0
n = 1 (base case) |	fib(n-2) = "-"	  | fib(n-1) = "0"	  | fib(n) = 1
n = 2             |	fib(n-2) = "0"	  | fib(n-1) = "1"	  | fib(n) = 1
n = 3             |	fib(n-2) = "1"	  | fib(n-1) = "1"	  | fib(n) = 2
n = 4             |	fib(n-2) = "1"	  | fib(n-1) = "2"	  | fib(n) = 3
n = 5             |	fib(n-2) = "2"	  | fib(n-1) = "3"	  | fib(n) = 5
n = 6             |	fib(n-2) = "3"	  | fib(n-1) = "5"	  | fib(n) = 8
n = 7             |	fib(n-2) = "5"	  | fib(n-1) = "8"	  | fib(n) = 13
n = 8             |	fib(n-2) = "8"	  | fib(n-1) = "13"	  | fib(n) = 21
n = 9             |	fib(n-2) = "13"	  | fib(n-1) = "21"	  | fib(n) = 34
n = 10            |	fib(n-2) = "21"	  | fib(n-1) = "34"	  | fib(n) = 55
n = 11            |	fib(n-2) = "34"	  | fib(n-1) = "55"	  | fib(n) = 89
n = 12            |	fib(n-2) = "55"	  | fib(n-1) = "89"	  | fib(n) = 144
n = 13            |	fib(n-2) = "89"	  | fib(n-1) = "144"	| fib(n) = 233
n = 14            |	fib(n-2) = "144"	| fib(n-1) = "233"	| fib(n) = 377
n = 15            |	fib(n-2) = "233"	| fib(n-1) = "377"	| fib(n) = 610
n = 16            |	fib(n-2) = "377"	| fib(n-1) = "610"	| fib(n) = 987
n = 17            |	fib(n-2) = "610"	| fib(n-1) = "987"	| fib(n) = 1597
n = 18            |	fib(n-2) = "987"	| fib(n-1) = "1597"	| fib(n) = 2584
n = 19            |	fib(n-2) = "1597"	| fib(n-1) = "2584"	| fib(n) = 4181
n = 20            |	fib(n-2) = "2584"	| fib(n-1) = "4181"	| fib(n) = 6765

  
1. If I had an unsorted collection of a million terms, I would use the linear search and the iteration solution to find the answer.
   I would chose linear search because it will take less amount of iterations to find the answer. If I used the binary search, I would 
   have to go through the data structure a million times to sort it before I could even start searching for the answer. 
     
   I would use the iteration method because it would be faster than the recursive and there is not a good reason to call the method 
   on itself. 
   
2. If I had a sorted collection of a million terms, I would use the binary search and the recursive solution to find the answer.
   I would chose binary search because it will take about 20 iterations to find the answer. If I used the linear search, It could 
   take up to a million times to go through the data structure.  
     
   I would use the recursive method and call the method on itself by passin in the new low, mid, and high values everytime. 
