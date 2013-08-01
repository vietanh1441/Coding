/*This is a c program that take a number n, then use 
The Sieve of Eratosthenes method to find all of the prime
number up to that n number*/

#include <math.h>
#include <stdio.h>
#include <stdbool.h>

void findPrime(bool a[], int limit)     //this is the function that use The Sieve 
{                                       //of Eratosthenes method
                                        //It take a boolean array a[]
    int i;                              //which is initially set at False
    int k;                              //then use the Sieve of Eratosthenes method 
    int j;                              //to mark the composite number as True
    k=2;                                
    int m;
    
    for (i=k; i< sqrt(limit); i++)      
    {
        if (a[i] == 0)
        {
            for (j=2; i*j <=limit; j++) //if we don't set the condition i*j <=limit,
            {                           //there will be Segmentation fault
                m = i*j;
                a[m] = true;
            }
            
        }
    }    
}


int main( void ) {
    
    int i;    
    int n;	// number n
	int total = 0;
    
    printf("Please insert number n: ");     //ask for use input number n
    scanf("%d", &n);
    printf("\n");
    
    bool a[n]; 
    for (i=0; i<=n; i++)                    //set all number to false
        {a[i] = false;};
        
    findPrime(a, n);                        //call function findPrime and return prime number
    
    for (i = 1; i <=n; i++)                 //print out the Prime number, whichever set as false
    {
        if (a[i] == false){
        printf("%d \n", i);
		total = total + i;}
    }
    printf("%d\n",total);
    int b;                                  // a scanf function just for reading the terminal's sake
    scanf("%d", &b);
    
    return 0;
}

