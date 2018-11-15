package com.sathish.sm.controller;
import java.io.*;
import java.util.Scanner;

public class Test {
	public static void reverse(String[] args) throws NumberFormatException, IOException {
		int num,x;
		
		System.out.println("enter a number");
		Scanner s=new Scanner(System.in);
		num=s.nextInt();
		s.close();
		/*BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
		num=Integer.parseInt(br.readLine());*/
		int rev=0;
		while(num!=0)
		{
			x=num%10;
			rev=(rev*10)+x;
			num/=10;
			System.out.println(rev);
		}
		System.out.println("reverse of the number is:::"+rev);
	}
	public static void feb(String[] args) {
		System.out.println("enter the size of the series");
		Scanner s=new Scanner(System.in);
		int size=s.nextInt();
		s.close();
		int a=0,b=1,i=0;
		int[] fb=new int[size+1];
		fb[0]=a;
		fb[1]=b;
		System.out.println("series");
		System.out.println(fb[0]);
		for(i=2;i<size;i++)
		{
			int c=a+b;
			a=b;
			b=c;
			fb[i]=c;
			//System.out.print(fb[i]);
		}
		for (int j = 0; j < size; j++) {
			System.out.print(fb[j]+"::");
		}
	}
	public static void armstrong(String[] args) {
		System.out.println("enter number");
		Scanner s=new Scanner(System.in);
		int num=s.nextInt();
		s.close();
		int resul=0,n=0,tmp,x;
		tmp=num;
		int tmp1=num;
		while(tmp!=0)
		{
			n++;
			tmp=tmp/10;
		}
		System.out.println("numbe of digits n:::"+n);
		while(num!=0)
		{
			x=num%10;
			resul+=Math.pow(x, n);
			num/=10;
		}
		if(resul==tmp1)
			System.err.println("number is a armstrong number");
		else 
			System.err.println("not a armstrong number");
	}
}
	
