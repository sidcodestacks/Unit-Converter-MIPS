.data
convert:.asciiz "\t\t\t********CONVERSION********\n\t\t\t 1.Length Conversion\n\t\t\t 2.Temperature Conversion\n\t\t\t 3.Area Conversion\n\t\t\t 4.Volume Conversion\n \nENTER YOUR CHOICE OF CONVERSION: \t"
    
    msg37: .asciiz"\n\n\tDO YOU WANT TO CONTINUE ? IF YES THEN PRESS 1 OTHERWISE PRESS 0 TO EXIT :\t"
    
    msg:.asciiz"ENTER YOUR CHOICE TO WHICH UNIT OF LENGTH YOU WANT TO CONVERT : \nFor kilometer ENTER-1\nFor meter ENTER-2\nFor foot ENTER-3\nFor inch ENTER-4\nFor centimeter ENTER-5\n"
	msg0:.asciiz"\nENTER YOUR CHOICE TO WHICH UNIT OF TEMPERATURE YOU WANT TO CONVERT : \nFor celsius ENTER-6\nFor farhenheit ENTER-7\nFor kelvin ENTER-8\n"
    msg1:.asciiz"\nENTER YOUR CHOICE TO WHICH UNIT OF AREA YOU WANT TO CONVERT : \nFor kilometer square ENTER-9\nFor meter square ENTER-10\nFor yard square ENTER-11\nFor foot square ENTER-12\n"
    msg2: .asciiz"\nENTER YOUR CHOICE TO WHICH UNIT OF vOLUME YOU WANT TO CONVERT : \nFor litre ENTER-13\nFor millilitre ENTER-14\nFor gallon ENTER-15\nFor cubic meter ENTER-16\n"
    msg40: .asciiz"\n\n\t\t\t\t------EXIT------\n"         #label "msg40"
    msg41: .asciiz"\n\n\t\t\tALERT MESSAGE: NUMBER ENTERED IS NOT VALID\n" 

    msg3:.asciiz"Enter the Length in kilometer =\n"        #label "msg3"
	msg4:.asciiz"Enter the Length in meter =\n"            #label "msg4"
	msg5:.asciiz"Enter the Length in foot =\n"             #label "msg5"
	msg6:.asciiz"Enter the Length in inch =\n"             #label "msg6"
	msg7:.asciiz"Enter the Length in centimeter =\n"       #label "msg7"
    
	msg8:.asciiz"Enter the Temperature in celsius =\n"     #label "msg8"
	msg9:.asciiz"Enter the Temperature in fahrenheit =\n"  #label "msg9"
	msg10:.asciiz"Enter the Temperature in kelvin =\n"     #label "msg10"
    
    msg11:.asciiz"Enter the Area in kilometer square =\n"  #label "msg11"
    msg12:.asciiz"Enter the Area in meter square =\n"      #label "msg12"
    msg13:.asciiz"Enter the Area in yard square =\n"       #label "msg13"
    msg14:.asciiz"Enter the Area in foot square =\n"       #label "msg14"
    
    
    msg16:.asciiz"Enter the Volume in litre =\n"           #label "msg16"
     msg17:.asciiz"Enter the Volume in millilitre =\n"     #label "msg17"
     msg18:.asciiz"Enter the Volume in gallon =\n"         #label "msg18"
     msg19:.asciiz"Enter the Volume in cubic meter =\n"    #label "msg19"
    
	msg20:.asciiz"\nResult in kilometer =\t"               #label "msg20"
	msg21:.asciiz"\nResult in meter =\t"                   #label "msg21"
	msg22:.asciiz"\nResult in feet =\t"                    #label "msg22"
	msg23:.asciiz"\nResult in inch =\t"                    #label "msg23"
	msg24:.asciiz"\nResult in centimeter =\t"              #label "msg24"
    
	msg25:.asciiz"\nResult in celsius =\t"                 #label "msg25"
	msg26:.asciiz"\nResult in fahrenheit =\t"              #label "msg26"
	msg27:.asciiz"\nResult in kelvin =\t"                  #label "msg27"
    
     msg28:.asciiz"\nResult in kilometer square =\t"       #label "msg28"
    msg29:.asciiz"\nResult  in meter square =\t"           #label "msg29"
    msg30:.asciiz"\nResult  in yard square =\t"            #label "msg30"
    msg31:.asciiz"\nResult  in foot square =\t"            #label "msg31"
    
    msg33:.asciiz"\nResult in litre =\t"                   #label "msg33"
     msg34:.asciiz"\nResult in millilitre =\t"             #label "msg34"
     msg35:.asciiz"\nResult in gallon =\t"                 #label "msg35"
     msg36:.asciiz"\nResult in cubic meter =\t"            #label "msg36"
    
    
    d1:.float 1000.0                        #store 1000.0 in d1
	d2:.float 3.28084                       #store 3.28084 in d2
	d3:.float 12.0                          #store 12.0 in d3
	d4:.float 2.54                          #store 2.54 in d4
	d5:.float 1.8                           #store 1.8 in d5
	d6:.float 32.0                          #store 32.0 in d6
	d7:.float 273.15                        #store 273.15 in d7
	d8:.float 0.001                         #store 0.001 in d8
	d9:.float 0.305                         #store 0.305 in d9
	d10:.float 0.0254                       #store 0.0254 in d10
	d11:.float 0.01                         #store 0.01 in d11
	d12:.float 459.67                       #store 459.67 in d12
    d13: .float 1000000.0                   #store 1000000.0 in d13
    d14: .float 1.19                        #store 1.19 in d14
    d15: .float 10.7                        #store 10.7 in d15
    d16: .float 9.0                         #store 9.0 in d16
    d17: .float 0.83                        #store 0.83 in d17
    d18: .float 0.000001                    #store 0.000001 in d18
    d19: .float 0.092                       #store 0.092 in d19
    d20: .float 0.111                       #store 0.111 in d20
    d21: .float 0.219                       #store 0.219 in d21
    d22: .float 4.546                       #store 4.546 in d12
    
.text
main:
loop:li $t1,1                               #load $t1 with 1
li $t2,2                                    #load $t2 with 2
li $t3,3                                    #load $t3 with 3
li $t4,4                                    #load $t4 with 4
la $a0,convert                              #load address of convert
li $v0,4                                    #call code to print string
syscall                                     #system call
li $v0,5                                    #call code to read integer
syscall                                     #system call
move $s7,$v0                                #move value of $t0 to $s7
beq $s7,$t1,length                          #if value of $s7 = value of $t1 ,then length
beq $s7,$t2,temperature                     #if value of $s7 = value of $t2 ,then temperature
beq $s7,$t3,area                            #if value of $s7 = value of $t3 ,then area
beq $s7,$t4,volume                          #if value of $s7 = value of $t4 ,then volume
blt $s7,$t1,error                           #if value of $s7 < value of $t1 ,then error 
bgt $s7,$t4,error                           #if value of $s7 > value of $t4 ,then error


continue:
li $t1,1                                     #store 1 to $t1
li $t2,0                                     #store 0 to $t2
la $a0,msg37                                 #load address of msg37
la $v0,4                                     #call code to print string
syscall                                      #system call
li $v0,5                                     #call code to read integer
syscall                                      #system call
move $t6,$v0                                 #move value of $v0 to $t6
beq $t6,$t1,loop                             #if value of $t6 = value of $t1 ,then loop
beq $t6,$t2,exit                             #if value of $t6 = value of $t2 ,then exit
blt $t1,$t6,error                            #if value of $t1 < value of $t6 , then error
bgt $t2,$t6,error                            #if value of $t2 > value of $t6 , then error



length: 
    la $a0,msg                               #load address of msg
	li $v0,4                                 #call code to print string
	syscall                                  #system call
	li $v0,5                                 #call code to read integer
	syscall                                  #system call
	move $t0,$v0                             #move value of $v0 to $t0
	li $t1,1	                             #load value 1 to $t1 
	li $t2,2                                 #load value 2 to $t2
	li $t3,3                                 #load value 3 to $t3
	li $t4,4                                 #load value 4 to $t4
	li $t5,5                                 #load value 5 to $t5
	beq $t1,$t0,l1                           #if value of $t1 = value of $t0 , then l1
	beq $t2,$t0,l2                           #if value of $t2 = value of $t0 , then l2 
	beq $t3,$t0,l3                           #if value of $t3 = value of $t0 , then l3
	beq $t4,$t0,l4                           #if value of $t4 = value of $t0 , then l4
	beq $t5,$t0,l5                           #if value of $t5 = value of $t0 , then l5
    blt $t1,$t0,error                        #if value of $t1 < value of $t0 , then error
    bgt $t5,$t0,error                        #if value of $t5 > value of $t0 , then error
    
    
	l1:
        la $a0,msg3                          #load address of msg3
		li $v0,4                             #call code to print string
		syscall                              #system call
		li $v0,6                             #call code to read float 
		syscall                              #system call
        l.s $f2,d1                           #load $f2 with 1000.0
		l.s $f3,d2                           #load #f3 with 3.2804
		l.s $f4,d3                           #load $f4 with 12.0
		l.s $f5,d4                           #load $f5 with 2.54
		mul.s $f6,$f0,$f2                    #$f6=$f0*1000.0
		mul.s $f7,$f6,$f3                    #$f7=$f6*3.2804
		mul.s $f8,$f7,$f4                    #$f8=$f7*12.0
		mul.s $f9,$f8,$f5                    #f9=$f8*2.54
        la $a0,msg21                         #load address of msg21
		li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f6                       #store value of $f6 in $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
        la $a0,msg22                         #load address of msg22
		li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f7                       #store value of $f7 in $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
        la $a0,msg23                         #load address of msg23
		li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f8                       #store value of $f8 in $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
        la $a0,msg24                         #load address of msg24
		li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f9                       #store value of $f9 in $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
		j continue                           #jump to continue
	
    l2: 
        la $a0,msg4                          #load address of msg4
		li $v0,4                             #call code to print string      
		syscall                              #system call
		li $v0,6                             #call code to read float
		syscall                              #system call
		l.s $f2,d8                           #load 0.001 to $f2
		l.s $f3,d2                           #load 3.28 to $f3 
		l.s $f4,d3                           #load 12.0 to $f4
		l.s $f5,d4                           #load 2.54 to $t5
		mul.s $f6,$f0,$f2                    #$f6=$f0*0.001
		mul.s $f7,$f0,$f3                    #$f7=$f0*3.28
		mul.s $f8,$f7,$f4                    #$f8=$f7*$f4
		mul.s $f9,$f8,$f5                    #$f9=$f8*$f5
        la $a0,msg20                         #load address of msg20
		li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f6                       #move value of $f6 to $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
        la $a0,msg22                         #load address of msg22
		li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f7                       #move value of $f7 to $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
		la $a0,msg23                         #load address of msg23
        li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f8                       #move value of $f8 to $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
		la $a0,msg24                         #load address of msg24
        li $v0,4                             #call code to print string
		syscall                              #system call
		mov.s $f12,$f9                       #move value of $f9 to $f12
		li $v0,2                             #call code to print float
		syscall                              #system call
		j continue                           #jump to continue
	
    l3:
        la $a0,msg5                         #load address of msg5
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float 
		syscall                             #system call
		l.s $f2,d9                          #load $f2 with 0.305
		l.s $f3,d8                          #load $f3 with 0.001
		l.s $f4,d3                          #load $f4 with 12.0
		l.s $f5,d4                          #load $f5 with 2.54
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f6,$f3                   #$f7=$f6*$f3
		mul.s $f8,$f0,$f4                   #$f8=$f0*$f4
		mul.s $f9,$f8,$f5                   #$f9=$f8*$f5
		la $a0,msg20                        #load address of msg20
        li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f1
		li $v0,2                            #call code to print float
		syscall                             #system call
		la $a0,msg21                        #load address of msg21
        li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system cal
		la $a0,msg23                        #load address of msg23
        li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg24                        #load address of msg24
		li $v0,4                            #call code to print string
		syscall                             #system cal
		mov.s $f12,$f9                      #move value of $f9 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
	
    l4:
        la $a0,msg6                         #load address of msg6
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d10                         #load $f2 with 0.0254
		l.s $f3,d8                          #load $f3 with 0.001
		l.s $f4,d2                          #load $f4 with 3.28084
		l.s $f5,d4                          #load $f5 with 2.54
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f6,$f3                   #$f7=$f6*$f3
		mul.s $f8,$f6,$f4                   #$f8=$f6*$f4
		mul.s $f9,$f0,$f5                   #$f9=$f0*$f5
        la $a0,msg20                        #load address of msg 20
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f1
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg21                        #load address of msg 21
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f1
		li $v0,2                            #call code to print float 
		syscall                             #system call
        la $a0,msg22                        #load address of msg 22
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg24                        #load address of msg 24
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f9                      #move value of $f9 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
	
    l5:
       la $a0,msg7                         #load address of msg 7
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call 
		l.s $f2,d11                         #store $f2 with 0.01 
		l.s $f3,d8                          #store $f3 with 0.001
		l.s $f4,d2                          #store $f4 with 3.28084
		l.s $f5,d3                          #store $f5 with 12.0
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f6,$f3                   #$f7=$f6*$f3
		mul.s $f8,$f6,$f4                   #$f8=$f6*$f4
		mul.s $f9,$f8,$f5                   #$f9=$f8*$f5
        la $a0,msg20                        #load address of msg 20
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg21                        #load address of msg 21
		li $v0,4                            #call code to print string
		syscall                             #system call 
		mov.s $f12,$f6                      #move value of $f6 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg22                        #load address of msg 22
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg23                        #load address of msg 23
		li $v0,4                            #call code to print string
		syscall                             #system call     
		mov.s $f12,$f9                      #move value of $f9 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue


temperature:
	li $v0,4                                #call code to print string
	la $a0,msg0                             #load address of msg0
	syscall                                 #system call
	li $v0,5                                #call code to read integer
	syscall                                 #system call
	move $t0,$v0                            #move value of $v0 to $t0
    li $t6,6                                #load $t6 with 6
	li $t7,7                                #load $t7 with 7
	li $t8,8                                #load $t8 with 8
	beq $t6,$t0,l6                          #if value of $t6 = value of $t0 , then l6
	beq $t7,$t0,l7                          #if value of $t7 = value of $t0 , then l7
	beq $t8,$t0,l8                          #if value of $t8 = value of $t0 , then l8
    blt $t6,$t0,error                        #if value of $t6 < value of $t0 , then error
    bgt $t8,$t0,error                        #if value of $t8 > value of $t0 , then error

	l6:la $a0,msg8                         #load address of msg8
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d5                          #load $f2 with 1.8
		l.s $f3,d6                          #load $f3 with 32.0
		l.s $f4,d7                          #load $f4 with 273.15
		mul.s $f5,$f2,$f0                   #$f5=$f2*$f0
		add.s $f6,$f5,$f3                   #$f6=$f5+$f3
		add.s $f7,$f4,$f0                   #$f7=$f4+$f0
        la $a0,msg26                        #load address of msg 26
        li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg27                        #load address of msg27
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue

	l7:
    la $a0,msg9                         #load address of msg9
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d5                          #load $f2 with 1.8
		l.s $f3,d6                          #load $f3 with 32.0
		l.s $f4,d7                          #load $f4 with 273.15
		l.s $f5,d12                         #load $f5 with 459.67
		sub.s $f6,$f0,$f3                   #$f6=$f0-$f3
		div.s $f7,$f6,$f2                   #$f7=$f6/$f2
		add.s $f8,$f0,$f5                   #$f8=$f0+$f5
		div.s $f9,$f8,$f2                   #f9=$f8/$f2
        la $a0,msg25                        #load address of msg25
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg27                        #load address of msg27
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
	
    l8:
    la $a0,msg10                        #load address of msg10
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d5                          #load f2 with 1.8
		l.s $f3,d6                          #load f3 with 32.0
		l.s $f4,d7                          #load f4 with 273.15
		sub.s $f6,$f0,$f4                   #$f6=$f0-$f4
		mul.s $f7,$f2,$f6                   #$f7=$f2*$f6
		add.s $f8,$f7,$f3                   #$f8=$f7+$f3
        la $a0,msg25                        #load address of msg25
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg26                        #load address of msg26
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call    
		j continue                          #jump to continue

area:
la $a0,msg1                             #load address of msg1
     li $v0,4                               #call code to print string
	
	syscall                                 #system call
	li $v0,5                                #call code to read integer
	syscall                                 #system call
	move $t0,$v0                            #move value of $v0 to $t0
    li $t9,9                                #load $t9 with 9
    li $s0,10                               #load $s0 with 10
    li $s1,11                               #load $s1 with 11
    li $s2,12                               #load $s12 with 12
	beq $t9,$t0,l9                          #if value of $t9 = value of $t0 , then l9
	beq $s0,$t0,l10                         #if value of $s0 = value of $t0 , then l10
	beq $s1,$t0,l11                         #if value of $s1 = value of $t0 , then l11
	beq $s2,$t0,l12                         #if value of $s2 = value of $t0 , then l12
    blt $t9,$t0,error                        #if value of $t9 < value of $t0 , then error
    bgt $s2,$t0,error                        #if value of $s2 > value of $t0 , then error
	
	l9:
       la $a0,msg11                        #load address of msg11
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d13                         #load $f2 with 100000.0
		l.s $f3,d14                         #load #f3 with 1.19
		l.s $f4,d15                         #load $f4 with 10.7
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f6,$f3                   #$f7=$f6*$f3
        mul.s $f8,$f0,$f7                   #$f8=$f0*$f7
		mul.s $f9,$f6,$f4                   #$f9=$f6*$f4
        mul.s $f10,$f0,$f9                  #$f10=$f0*$f9
        la $a0,msg29                        #load address of msg29
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #store value of $f6 in $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg30                        #load address of msg30
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #store value of $f8 in $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg31                        #load address of msg31
		li $v0,4                            #call code to print string   
		syscall                             #system call
		mov.s $f12,$f10                     #store value of $f10 in $f12
		li $v0,2                            #call code to print float
		syscall                             #system call	
		j continue                          #jump to continue
	
    l10:
       la $a0,msg12                        #load address of msg12
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d18                         #load $f2 with 0.000001
		l.s $f3,d14                         #load $f3 with 1.19
		l.s $f4,d15                         #load $f4 with 10.7
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f0,$f3                   #$f7=$f0*$f3
		mul.s $f8,$f0,$f4                   #$f8=$f0*$f4
        la $a0,msg28                        #load address of msg28 
		li $v0,4                            #call code to print string 
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg30                        #load address of msg30
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg31                        #load address of msg31 
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
        
	l11:
        la $a0,msg13                        #load address of msg13
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d17                         #load f2 with 0.83
		l.s $f3,d16                         #load f3 with 9.0
        l.s $f4,d18                         #load f4 with 0.000001
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f6,$f4                   #$f7=$f6*$f4
        mul.s $f8,$f0,$f7                   #$f8=$f0*$f7
		mul.s $f9,$f0,$f3                   #$f9=$f0*$f3
		la $a0,msg28                        #load address of msg 28
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg29                        #load address of msg 29
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f1
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg31                        #load address of msg 31
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f9                      #move value of $f9 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
        
	l12:
        la $a0,msg14                        #load address of msg 14
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
        l.s $f2,d19                         #load f2 with 0.092
		l.s $f3,d18                         #load f8 with 0.000001
		l.s $f4,d20                         #load f4 with 0.111
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f6,$f3                   #$f7=$f6*$f3
		mul.s $f8,$f0,$f2                   #$f8=$f0*$f2
		mul.s $f9,$f0,$f4                   #$f9=$f0*$f$
        la $a0,msg28                        #load address of msg 28
		li $v0,4                            #call code to print string
		syscall                             #system call                    
		mov.s $f12,$f7                      #move value of $f7 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg29                        #load address of msg 29
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg30                        #load address of msg 30
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f9                      #move value of $f9 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
	
volume:
    la $a0,msg2                             #load address of msg2  
     li $v0,4                               #call code to print string
	syscall                                 #system call
	li $v0,5                                #call code to read integer
	syscall                                 #system call
	move $t0,$v0                            #move value of $v0 to $t0
    li $s3,13                               #load $s3 with 13
    li $s4,14                               #load $s4 with 14
    li $s5,15                               #load $s5 with 15
    li $s6,16                               #load $s6 with 16
	beq $s3,$t0,l13                         #if value of $s3 = value of $t0 , then l13
	beq $s4,$t0,l14                         #if value of $s4 = value of $t0 , then l14
	beq $s5,$t0,l15                         #if value of $s5 = value of $t0 , then l15
	beq $s6,$t0,l16                         #if value of $s6 = value of $t0 , then l16
    blt $s3,$t0,error                        #if value of $s3 < value of $t0 , then error
    bgt $s6,$t0,error                        #if value of $s6 > value of $t0 , then error

	l13:
        la $a0,msg16                        #load address of msg 16
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d1                          #load $f2 = 1000.0
		l.s $f3,d21                         #load #f3 = 0.219
		l.s $f4,d18                         #load $f4 = 0.000001
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f0,$f3                   #$f7=$f0*$f3
		mul.s $f8,$f2,$f4                   #$f8=$f2*$f4
        mul.s $f9,$f0,$f8                   #$f9=$f0*$f8
        la $a0,msg34                        #load address of msg 34
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #store value of $f6 in $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg35                        #load address of msg 35
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #store value of $f7 in $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg36                        #load address of msg 36
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f9                      #store value of $f9 in $f12
		li $v0,2                            #call code to print float
		syscall                             #system call		
		j continue                          #jump to continue
        
	l14:
        la $a0,msg17                        #load address of msg 17
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d18                         #load $f2 with 0.000001
        l.s $f3,d1                          #load $f3 with 1000.0
		l.s $f4,d21                         #load $f4 with 0.219
		mul.s $f6,$f3,$f2                   #$f6=$f3*$f2
        mul.s $f7,$f0,$f6                   #$f7=$f0*$f6
		mul.s $f8,$f0,$f4                   #$f8=$f0*$f4
        mul.s $f9,$f8,$f6                   #$f9=$f8*$f6
		mul.s $f10,$f0,$f2                  #$f10=$f0*$f2
        la $a0,msg33                        #load address of msg 33
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg35                        #load address of msg 35
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f9                      #move value of $f9 to $f12
		li $v0,2                            #print float
		syscall                             #system call
        la $a0,msg36                        #load address of msg 36
		li $v0,4                            #call code to print string 
		syscall                             #system call
		mov.s $f12,$f10                     #move value of $f10 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
        
	l15:
        la $a0,msg18                        #load address of msg 18
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d22                         #load $f2 with 4.546
		l.s $f3,d1                          #load $f3 with 1000.0
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
        mul.s $f7,$f2,$f3 #ml               #$f7=$f2*$f3
		mul.s $f8,$f0,$f7                   #$f8=$f0*$f7
        div.s $f9,$f2,$f3                   #f9=$f2/$f3
		mul.s $f10,$f0,$f9                  #$f10=$f0*$f9
        la $a0,msg33                        #load address of msg 33
		li $v0,4                            #call code to print strin
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg34                        #load address of msg 34
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f8                      #move value of $f8 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg36                        #load address of msg 36
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f10                     #move value of $f10 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
        
	l16:
    la $a0,msg19                        #load address of msg 19
		li $v0,4                            #call code to print string
		syscall                             #system call
		li $v0,6                            #call code to read float
		syscall                             #system call
		l.s $f2,d1                          #load $f2 with 1000.0
		l.s $f3,d13                         #load $f3 with 1000000.0
		l.s $f4,d21                         #load $f4 with 0.219
		mul.s $f6,$f0,$f2                   #$f6=$f0*$f2
		mul.s $f7,$f0,$f3                   #$f7=$f0*$f3
		mul.s $f8,$f0,$f2                   #$f8=$f0*$f2
		mul.s $f9,$f8,$f4                   #$f9=$f8*$f4
        la $a0,msg33                        #load address of msg 33
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f6                      #move value of $f6 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg34                        #load address of msg 34
		li $v0,4                            #call code to print string
		syscall                             #system call
		mov.s $f12,$f7                      #move value of $f7 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
        la $a0,msg35                        #load address of msg 35
		li $v0,4                            #call code to print string
		
		syscall                             #system call
		mov.s $f12,$f9                      #move value of $f9 to $f12
		li $v0,2                            #call code to print float
		syscall                             #system call
		j continue                          #jump to continue
        
        
error: la $a0,msg41                         #load address of msg41
       li $v0,4                             #call code to print string
       syscall                              #system call
       j continue                           #jump to continue
       

exit: la $a0,msg40                          #load address of msg40
      li $v0,4                              #call code to print string
      syscall                               #system call
      li $v0,10                             #call code for termination
      syscall                               #system call
      .end main                             #end of main




















