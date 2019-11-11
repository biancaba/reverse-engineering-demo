#include<stdio.h>
 
int sum(int a){
    a += 2;
    a += 4;
    return a;
}

int main()
{
   int input;
   
   printf("Enter the code:\n");
   scanf("%d", &input);
   
   if(input == sum(5))
      printf("Correct number. Hurray!\n");
   else
      printf("Incorrect. Try again :(\n");
   
   return 0;
}