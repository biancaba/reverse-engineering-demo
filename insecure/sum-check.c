#include<stdio.h>
 
#define NUM_BRANCH_TARGETS 4
void (*branch_targets[NUM_BRANCH_TARGETS])(void);
int signature = 0;
void (*target)(void) = NULL;

__asm__ (".text\n"
	".globl	branch\n"
	".type	branch, @function\n"
        "branch:\n"
        "\tpush %rax\n"
        "\tpush %rdx\n"
	"\tmovslq	signature(%rip), %rdx\n"
	"\tleaq	branch_targets(%rip), %rax\n"
	"\tmovq	(%rax,%rdx,8), %rax\n"
	"\tmovq	%rax, target(%rip)\n"
        "\tpop %rdx\n"
        "\tpop %rax\n"
        "\tjmp *target(%rip)\n");
__asm__ (".globl	label1\n"
	".type	label1, @function\n"
        "label1:\n"
        "\taddl $4, %edi\n"
        "\taddl $1, signature(%rip)\n"
        "\tjmp branch\n");
__asm__ (".globl	label2\n"
	".type	label2, @function\n"
        "label2:\n"
        "\taddl $2, %edi\n"
        "\taddl $1, signature(%rip)\n"
        "\tjmp branch\n");

int sum(int a){
    __asm__ volatile ("\tjmp branch");
    __asm__ volatile (".globl label3\n"
            ".type label3, @function\n"
            "label3:\n");
    __asm__ ("\tmov %%edi, %0\n" : "=r" (a));
    return a;
}

int main()
{
   int input;
   __asm__ volatile ("movq $label1, %0" :: "m" (branch_targets[0]));
   __asm__ volatile ("movq $label2, %0" :: "m" (branch_targets[1]));
   __asm__ volatile ("movq $label3, %0" :: "m" (branch_targets[2]));
   
   printf("Enter the code:\n");
   scanf("%d", &input);
   
   if(input == sum(5))
      printf("Correct number. Hurray!\n");
   else
      printf("Incorrect. Try again :(\n");
   
   return 0;
}
