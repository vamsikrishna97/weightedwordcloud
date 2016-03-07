
#include<stdio.h>
void add(char a[10],int i,int j);
void f_name(char a[10],int i);

main()
{
	char c[100],a[10]="doc-";
	int n=1,l=1;
	fstream f("book.txt",ios::in);
	while(f>>c)
   	{ 
   	    f_name(a,l);
	    l++;
		fstream f1(a,ios::out);
		f1<<c<<" ";
	   	n++;
	 
	   while(n%300!=0&&(f>>c))
		{
			f1<<c<<" ";	 	
	        n++;
		}
        printf("%d \n",l);	
		n++;
		f1<<'\0';
	     f1.close();	 	 
	}
	f.close();
}

void add(char a[10],int i,int j)
{
	int f=4,num;
	while(j>1)
	{
		j=j/10;
		num=i/j;
		i=i%j;
		a[f++]=num+48;
	}
  a[f]='\0';
}

void f_name(char a[10],int i)
{
		if(i<10)
		{
		    add(a,i,10);	
		}
		else if(i<100)
		{
			add(a,i,100);
		}
		else if(i<1000)
		{
			add(a,i,1000);
		}
		else 
		{
			add(a,i,10000);
		}
}
