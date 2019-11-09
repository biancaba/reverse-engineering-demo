#include<stdio.h>
 
int CODE = 265;

int main()
{
   int input;
   
   printf("Enter the code:\n");
   scanf("%d", &input);
   
   if(input == CODE)
      printf("Correct number. Hurray!\n");
   else
      printf("Incorrect. Try again :(\n");
   
   return 0;
}