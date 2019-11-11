#include<stdio.h>
 
int compute_code(){
    int rand, rand2;
    int c = 0;
    int temp1 = 17;
    int temp2 = 13;

    rand = c + 17;
    c += temp1 * temp2;

    rand = rand - temp2;
    temp1 = 11;
    temp2 = 5;

    rand2 = rand + c;
    c += temp1 * temp2;

    rand = rand2 / temp2;
    c -= 31;
    return c;
}

int main()
{
   int code;
   int input;
   
   printf("Enter the code:\n");
   scanf("%d", &input);

   code = compute_code();
   
   if(input == code + 4)
      printf("Correct number. Hurray!\n");
   else
      printf("Incorrect. Try again :(\n");
   
   return 0;
}