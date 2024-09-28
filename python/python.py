import socket

domain = input("Enter your Domain or ip:")

ip = socket.gethostbyname(domain)


print(f"The Ip address os {domain} is {ip}")

