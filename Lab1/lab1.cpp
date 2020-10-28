#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>
#include<string.h>
using namespace std;

int n;

void BitAddition(char A, char B, char CIN, char &Sum, char &COUT)
{
    if((A-'0')+(B-'0')+(CIN-'0')==0)
    {
        Sum='0';
        COUT='0';
    }
    else if((A-'0')+(B-'0')+(CIN-'0')==1)
    {
        Sum='1';
        COUT='0';
    }
    else if((A-'0')+(B-'0')+(CIN-'0')==2)
    {
        Sum='0';
        COUT='1';
    }
    else if((A-'0')+(B-'0')+(CIN-'0')==3)
    {
        Sum='1';
        COUT='1';
    }
}


void NBitAddition(char* A, char *B, char CIN, char* Sum, char &COUT)
{
    for(int i=n-1;i>=0;--i)
    {
        BitAddition(*(A+i), *(B+i), CIN, *(Sum+i), COUT);
        CIN=COUT;
    }
    *(Sum+n)='\0';
}

void Inverse(char* A, char* B)
{
    for(int i=0;i<n;++i)
    {
        if(*(A+i)=='0')
        {
            *(B+i)='1';
        }
        else
        {
            *(B+i)='0';
        }
    }
    *(B+n)='\0';
}

void TwoSCompliment(char* A, char *B)
{
    Inverse(A,B);
    char CIN,COUT;
    CIN='1';
    for(int i=0;i<n;++i)
    {
        *(A+i)='0';
    }
    NBitAddition(A,B,CIN,B,COUT);
}

void NBitSubtraction(char* A, char *B, char CIN, char* Sum, char &COUT)
{
    Inverse(B,B);
    if(CIN=='0')
    {
        CIN='1';
    }
    else
    {
        CIN='0';
    }
    NBitAddition(A,B,CIN,Sum,COUT);
}

bool isOverflow(char* A, char* B, char* Sum, char COUT, int operation)
{
    bool of=true;
    if(operation=='0')
    {
        if(((*A)-'0')+((*B)-'0')==0)
        {
            NBitAddition(A,B,'0',Sum,COUT);
            if(*Sum=='0')
            {
                of=false;
            }
            else
            {
                of=true;
            }
        }
        else if(((*A)-'0')+((*B)-'0')==1)
        {
            of=false;
        }
        else if(((*A)-'0')+((*B)-'0')==2)
        {
            char *C;
            C=(char*)malloc(n+1);
            strcpy(C,A);
            TwoSCompliment(C,A);
            strcpy(C,B);
            TwoSCompliment(C,B);
            NBitAddition(A,B,'0',Sum,COUT);
            if(*Sum=='0')
            {
                of=false;
            }
            else
            {
                of=true;
            }
        }
    }
    else
    {
        if((((*A)-'0')+((*B)-'0')==0)||(((*A)-'0')+((*B)-'0')==2))
        {
            of=false;
        }
        else if((*A-'0')==0&&(*B-'0')==1)
        {
            char *C;
            C=(char*)malloc(n+1);
            strcpy(C,B);
            TwoSCompliment(C,B);
            NBitAddition(A,B,'0',Sum,COUT);
            if(*Sum=='0')
            {
                of=false;
            }
            else
            {
                of=true;
            }
        }
        else if((*A-'0')==1&&(*B-'0')==0)
        {
            char *C;
            C=(char*)malloc(n+1);
            strcpy(C,A);
            TwoSCompliment(C,A);
            NBitAddition(A,B,'0',Sum,COUT);
            if(*Sum=='0')
            {
                of=false;
            }
            else
            {
                of=true;
            }
        }
    }
    return of;
}

int main() {
    cin>>n;
    char *A, *B, CIN, *Sum, COUT,operation;
    A=(char*)malloc(2);
    B=(char*)malloc(2);
    Sum=(char *)malloc(2);
    cin>>A>>B>>CIN;
    BitAddition(*A, *B, CIN, *Sum, COUT);
    cout<<*Sum<<" "<<COUT<<"\n";
    realloc(A,n+1);
    realloc(B,n+1);
    realloc(Sum,n+1);
    cin>>A>>B>>CIN;
    NBitAddition(A,B,CIN,Sum,COUT);
    cout<<Sum<<" "<<COUT<<"\n";
    cin>>A;
    Inverse(A,B);
    cout<<B<<"\n";
    cin>>A;
    TwoSCompliment(A,B);
    cout<<B<<"\n";
    cin>>A>>B>>operation;
    cout<<isOverflow(A,B,Sum,COUT,operation)<<"\n";
    cin>>A>>B>>CIN;
    NBitSubtraction(A,B,CIN,Sum,COUT);
    cout<<Sum<<" "<<COUT<<"\n";
    return 0;
}
