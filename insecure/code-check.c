#include<stdio.h>
 
int main()
{
   int code = 265;
   int input;
   
   printf("Enter the code:\n");
   scanf("%d", &input);
   
   if(input == code)
      printf("Correct number. Hurray!\n");
   else
      printf("Incorrect. Try again :(\n");
   
   return 0;
}