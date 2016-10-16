#!/usr/bin/python

import poplib
from email import parser

pop_conn = poplib.POP3_SSL('pop.gmail.com')
pop_conn.user('vervalenpaiva@gmail.com')
pop_conn.pass_('meubebe634901')
#Get message num from server:
numMsgs, totalSize = pop_conn.stat()
#Print result:
print(numMsgs)
#Quit:
pop_conn.quit()
