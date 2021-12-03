#include<stdio.h>
#include<conio.h>
#include<string.h>

char input[100];
int E(), EP(), T(), TP(), F(), idx;

int E() {
    if(T())
        return EP();
    else 
        return 0;
}
int EP() {
    if(input[idx] == '+') {
        idx++;
        if(T()) {
            if(EP())
                return 1;
            else
                return 0;
        } else
            return 0;
    } else
        return 1;
}
int T() {
        if(F()) 
            return TP();
        else
            return 0;
}
int TP() {
    if(input[idx]=='*') {
        idx++;
        if(F()) 
            return TP();
        else
            return 0;
    } else
        return 1;
}
int F() {
    if(input[idx] == '(') {
        idx++;
        if(E()) {
            if(input[idx]==')') {
                idx++;
                return 1;
            } else
                return 0;
        } else
            return 0;
    } else if (input[idx] >= 'a' && input[idx] <= 'z' || input[idx] >= 'A' && input[idx] <= 'Z') {
        idx++;
        return 1;
    } else
        return 0;
}


int main() {

    printf("Recursive descent parsing for the following grammar\n");
    printf("E->TE'\nE'->+TE'|@\nT->FT'\nT'->*FT'|@\nF->(E)|ID\n");
    printf("Enter the string to be checked : ");
    gets(input);

    if(E()) {
        if(input[idx + 1] == '\0')
            printf("String is accepted\n");
        else
            printf("String is not accepted\n");
    } else {
        printf("String not accepted");
    }
    return 0;
}
