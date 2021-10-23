FROM whatwewant/zmicro:v1.3.8

RUN   zmicro update -a

RUN   zmicro plugin install workspace

RUN   zworkspace initialize nodejs