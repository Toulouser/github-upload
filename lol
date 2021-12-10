Distributed  Computing 
 Lab Internal



Name: Aryan Mannan
Roll No:2019UCS2011

LIST OF PRACTICALS

1-Program to implement non-token based algorithm for Mutual Exclusion
2-Program to implement Lamport’s Logical Clock
3-Program to implement edge chasing distributed deadlock detection algorithm.
4-Program to implement locking algorithm.
5-Program to implement Remote Method Invocation.
6-Program to implement Remote Procedure Call.
7-Program to implement Chat Server.
8-Program to implement termination detection
9- Program to implement RSA and diffie hellman key exchange algorithms





Program to implement non-token based algorithm for Mutual Exclusion
Code:
#include<stdio.h>
void main()
{
int i,d,p,a,c=0,aa[10],j,n;
char ch='y';
printf("please enter the number of processes");
scanf("%d",&n);
i=0;
do
{
printf("please enter the process number which wants to execute critical section");
scanf("%d",&a);
aa[i]=a;
i++;
c=c+1;
d=i;
printf("some other process want to execute cs? input y if yes");
fflush(0);
scanf("%c",&ch);
}
while(ch=='y');
for(j=1;j<=c;j++)
{
printf("\ncritical section is executing for process %d in queue",j);
printf("\ncritical section is finished for process %d",j);
printf("\nrelease message has been sent by process%d",j);
}}
 
 
Output:
 

 
Program to implement Lamport’s Logical Clock
Code:
#include <stdio.h>
long p1(int);
long p2(int);
long p3(int);
long p4(int);

int main()
{
    int p;
    printf("##### MENU #####\n");
    printf("Enter process number between 1 to 4.\n");
    printf("Enter process number: \n");
    scanf("%d", &p);
    switch(p)
    {

        case 1: p1(1);
        case 2: p2(1);
        case 3: p3(1);
        case 4: p4(1);
    }


    printf("\n##### Logical Clock #####\n");
    printf("P1: %ld\nP2: %ld\nP3: %ld\nP4: %ld\n", p1(0), p2(0), p3(0), p4(0));

}

long p1(int i)
{
    static long x = 0;
    if (i == 1)
    {
        x++;
        p2(1);
        return 1;
    }
    else
        return x;
}

long p2(int i)
{
    static long x = 0;
    if (i == 1)
    {
        x++;
        p3(1);
        p4(1);
        return 1;
    }
    else
        return x;
}
long p3(int i)
{ static long x = 0;
    if (i == 1)
    {
        x++;
        return 1;
    }  else
        return x;
}long p4(int i)
{
    static long x = 0;
    if (i == 1)
    {   x++;
        p3(1);
        return 1;
    }else
        return x;}
Output:




Program to implement edge chasing distributed deadlock detection algorithm.
Code:
#include<iostream>
using namespace std;
 
int main()
{
 int process[10],num,i,process1,site1,sp1,sp2;
 
 cout<<"Enter the total number of sites\n";
 cin>>num;
 
 for(i=0;i<num;i++)
 {
     cout<<"Enter the total number of processes in site"<<i+1;
     cin>>process[i];
 }
 
 for(i=0;i<num;i++)
 {
    cout<<"\n The total number of processes in site"<<i+1<<" are: "<<process[i];
 }
 
 cout<<"\n\n Please input the site number and process id on which deadlock detection should be performed\n";
 cin>> site1;
 cin>>process1;
 
 cout<<"Please input the processes of two different sites that are connected with requesting edge\n";
 cin>>sp1;
 cin>>sp2;
 
 cout<<"*************************************************************************\n";
 cout<<"the probe message is"<<"("<<process1<<","<<sp1<<","<<sp2<<")";
 
 if(process1==sp2)
    cout<<"\n Deadlock has been detected!";
    else
    cout<<"\n No Deadlock has been detected!";
 return 0;
}
 
Output:

 
 
 
 
 
 
Program to implement locking algorithm.
Code:
#include<stdio.h>
void main()
{
int a=0;
char b,c;
do
{ printf("if transaction (T1) wants to lock data object");
fflush(0);
scanf("%c",&b);
if(a==0 && b=='y')
{a=1;
b='n';}
else if(a==1)
printf("/n hi! the data object is locked");
printf("if transaction (T2) wants to lock data object");
fflush(0);
scanf("%c",&b);
if(a==0 && b=='y')
{ a=1;
b='n';
}
else
printf("\nhi! the data object is locked");
printf("\nif transaction want to release data object");
fflush(0);
scanf("%c",&b);
if(a==1 && b=='y')
a=0;
printf("\n Do you want to continue (?)");
fflush(0);
scanf("%c",&c);
}while(c=='y'); }
Output:







Program to implement Remote Method Invocation.
Code:
          Server Application:
           import java.rmi.*;  
import java.rmi.registry.*;  
public class MyServer{  
public static void main(String args[]){  
try{  
Adder stub=new AdderRemote();  
Naming.rebind("rmi://localhost:5000/sonoo",stub);  
}catch(Exception e){System.out.println(e);}  
}  
}  
 
 Client Application:
 
import java.rmi.*;  
public class MyClient{  
public static void main(String args[]){  
try{  
Adder stub=(Adder)Naming.lookup("rmi://localhost:5000/sonoo");  
System.out.println(stub.add(34,4));  
}catch(Exception e){}  
}  
}  
 
Output:




Program to implement Remote Procedure Call.
Code:
#include <bits/stdc++.h>
using namespace std;
void displayTimeStamps(int e1, int e2, int p1[], int p2[]){
cout << "The time stamps of events in process one:\n";
for (int i = 0; i < e1; i++) {
cout << p1[i] << " ";
}
 cout << "\n";
cout << "The time stamps of events in process two:\n";
for (int i = 0; i < e2; i++)
cout << p2[i] << " ";
}
void lamport(int e1, int e2, vector<vector<int>> mat){
int p1[e1], p2[e2];
for (int i = 0; i < e1; i++)
p1[i] = i + 1;
for (int i = 0; i < e2; i++)
p2[i] = i + 1;
for (int i = 0; i < e1; i++) {
for (int j = 0; j < e2; j++) {


 if (mat[i][j] > 0) {
 p2[j] = max(p2[j], p1[i] + 1);
for (int k = j + 1; k < e2; k++)
p2[k] = p2[k - 1] + 1;
}

			if (mat[i][j] < 0) {
				p1[i] = max(p1[i], p2[j] + 1);
				for (int k = i + 1; k < e1; k++)
					p1[k] = p1[k - 1] + 1;
			}	}
	}

displayTimeStamps(e1, e2, p1, p2);
}

int main()
{
    int e1,e2;
    cin >> e1 >> e2;
 vector<vector<int>> mat(e1, vector<int>(e2));
    for(int i=0; i<e1; i++){
        for(int j=0; j<e2; j++){
            cin >> mat[i][j];
} }
lamport(e1, e2, mat);
}

Output:


Program to implement Chat Server
Code:
// Server-side Synchronous Chatting Application
// using C++ boost::asio
#include <boost/asio.hpp>
#include <iostream>
using namespace std;
using namespace boost::asio;
using namespace boost::asio::ip;

// Driver program for receiving data from buffer
string getData(tcp::socket& socket)
{
    streambuf buf;
    read_until(socket, buf, "\n");
    string data = buffer_cast<const char*>(buf.data());
    return data;
}
// Driver program to send data
void sendData(tcp::socket& socket, const string& message)
{
    write(socket,
          buffer(message + "\n"));
}
int main(int argc, char* argv[])
{
    io_service io_service;

    // Listening for any new incomming connection
    // at port 9999 with IPv4 protocol
    tcp::acceptor acceptor_server(
        io_service,
        tcp::endpoint(tcp::v4(), 9999));

    // Creating socket object
    tcp::socket server_socket(io_service);

    // waiting for connection
    acceptor_server.accept(server_socket);

    // Reading username
    string u_name = getData(server_socket);
    // Removing "\n" from the username
    u_name.pop_back();

    // Replying with default message to initiate chat
    string response, reply;
    reply = "Hello " + u_name + "!";
    cout << "Server: " << reply << endl;
    sendData(server_socket, reply);

    while (true) {

        // Fetching response
        response = getData(server_socket);

        // Popping last character "\n"
        response.pop_back();
      // Validating if the connection has to be closed
        if (response == "exit") {
            cout << u_name << " left!" << endl;
            break;
        }
        cout << u_name << ": " << response << endl;

      // Reading new message from input stream
        cout << "Server"
             << ": ";
        getline(cin, reply);
        sendData(server_socket, reply);

        if (reply == "exit")
            break;
    }
    return 0;
}

// Client-side Synchronous Chatting Application
// using C++ boost::asio

#include <boost/asio.hpp>
#include <iostream>
using namespace std;
using namespace boost::asio;
using namespace boost::asio::ip;

string getData(tcp::socket& socket)
{
    streambuf buf;
    read_until(socket, buf, "\n");
    string data = buffer_cast<const char*>(buf.data());
    return data;
}
void sendData(tcp::socket& socket, const string& message)
{
    write(socket,
          buffer(message + "\n"));
}

int main(int argc, char* argv[])
{
    io_service io_service;
    // socket creation
    ip::tcp::socket client_socket(io_service);

    client_socket
        .connect(
            tcp::endpoint(
                address::from_string("127.0.0.1"),
                9999));

    // Getting username from user
    cout << "Enter your name: ";
    string u_name, reply, response;
    getline(cin, u_name);

    // Sending username to another end
    // to initiate the conversation
    sendData(client_socket, u_name);

    // Infinite loop for chit-chat
    while (true) {

        // Fetching response
        response = getData(client_socket);

        // Popping last character "\n"
        response.pop_back();

        // Validating if the connection has to be closed
        if (response == "exit") {
            cout << "Connection terminated" << endl;
            break;
        }
        cout << "Server: " << response << endl;

        // Reading new message from input stream
        cout << u_name << ": ";
        getline(cin, reply);
        sendData(client_socket, reply);
    if (reply == "exit")
            break;
    }
    return 0;
}

Output:




Program to implement termination detection
Code:
#include<stdio.h>
#include<time.h>
#include<stdlib.h>
#include<math.h>
#include <unistd.h>
void main()
{
int i,j,k=0,n,tw,total=0,we,ca,w[20];
printf("Please enter the number of process(es)");
scanf("%d",&n);
printf("\n\n please assign a controlling agent");
scanf("%d",&ca);
printf("\n\nplease enter the total weight");
scanf("%d",&tw);
while((k<n))
{
rand();
tw=rand();
w[k]=tw;
tw=tw-w[k];
k++;
}
for(k=0;k<n;k++)
{total=total+w[k];}
printf("%d",total);
w[n-1]=abs(tw-total);
printf("%d",w[n-1]);
printf("\n\n\t\t\t\tControlling agent%d %d\n\n\n",ca,w[ca]);
printf("\n\nsending computational message to\t\n\n");
for(j=0;j<n;j++)
{if(j!=(ca-1))
{sleep(3);
printf("\nprocess%d %d",j+1,w[j]);
}}}

Output: 


 Program to implement RSA and DIFF HELLMAN key exchange algorithms.

I. RSA
Code:
#include<iostream>
#include<math.h>
using namespace std;
int GCD(int x, int y)
{
    int temp;
    while(1)
    {
        temp = x%y;
        if(temp==0)
        return y;
        x = y;
        y = temp;
    } }
int main()
{
    double p,q,n;
    double count;
    double totient;
    
    //encrypt (public key)
    double e;
    cout<<"Please enter two prime numbers p & q";
    cin>>p>>q;
    n=p*q;
    totient=(p-1)*(q-1);
    // value of e should be such that gcd(e,totient)=1
    cout<<"\nPlease enter the value of e for encryption";
    cin>>e;
    //for checking co-prime which satisfies e>1
    while(e<totient){
    count = GCD(e,totient);
    if(count==1)
        break;
    else
        e++;
    }
// decrypt (private key)
   
 double d;
    
//k can be any arbitrary value
    double k=2;
    double msg;
    cout<<"\nenter Message data value";
    cin>>msg;

    //d should satisfy d*e = 1 + k * totient
    d = (1 + (k*totient))/e;
    double c = pow(msg,e);
    double m = pow(c,d);
    c=fmod(c,n);
    m=fmod(m,n);

    cout<<"\np = "<<p;
    cout<<"\nq = "<<q;
    cout<<"\nn = pq = "<<n;
    cout<<"\ntotient = "<<totient;
    cout<<"\ne = "<<e;
    cout<<"\nd = "<<d;
    cout<<"\nHence, Encrypted data is "<<c;
    cout<<"\nThe Original Message sent is "<<m;
    return 0;
}

Output:



II. Diffie Hellman
Code:
#include<bits/stdc++.h>
using namespace std;
long long int q, alpha, PublicKeyAlice, PrivateKeyAlice, PublicKeyBob, PrivateKeyBob, SharedKeyAlice_Ka, SharedKeyBob_Kb;
long long int  KeyCalculate (long long int a, long long int power, long long int q);
void Alice();
void Bob();
void TheSharedKey();

int main()
{
    cout<<"Diffie Hellman Key Encryption Algorithm\n";
    cout << "Please enter the value of prime number (q) : ";
	cin >> q ;
    cout << "Please enter the primitive root modulo value (Alpha) : ";
	cin >> alpha ;
	cout <<"\n";

	Alice();
	Bob();
	TheSharedKey();
    return 0;
}


long long int KeyCalculate(long long int a, long long int power, long long int q)
{
    // CalculateKey function to return value of a^power mod q
	long long int temp = a;

   while ( --power )      // power-1 times execution of loop for multiplying in number of the power
    {
        temp *= a;         // Y ^ ax
        temp %= q;        //mod of (Y^ax)
    }

    return temp ;
}

void Alice ()
{
    //random private key generation for Alice or client 1
    srand (time(NULL));
    PrivateKeyAlice = rand() % 1000 + 1;
	cout << "The randomly selected private key for Client 1 : " << PrivateKeyAlice << endl;

	PublicKeyAlice = KeyCalculate(alpha, PrivateKeyAlice, q); // gets the generated key

}
void Bob ()
{
    //random pvt key generation for Bob or client 2
    PrivateKeyBob = rand() % 1000 + 1;
	cout << "The randomly selected private key for Client 2 : " << PrivateKeyBob << endl << endl ;

	PublicKeyBob = KeyCalculate(alpha, PrivateKeyBob, q); 

}
void TheSharedKey()
{
    SharedKeyAlice_Ka = KeyCalculate(PublicKeyBob, PrivateKeyAlice, q); // Secret key for Alice
	SharedKeyBob_Kb = KeyCalculate(PublicKeyAlice, PrivateKeyBob, q); // Secret key for Bob

	cout << "The Shared Secret key for:";
	cout<<"\n Client 1 is : " << SharedKeyAlice_Ka;
	cout <<"\n Client 2 is : " << SharedKeyBob_Kb;

}
Output:








 
 
 
 
 
 

