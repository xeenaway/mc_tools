# -*- coding: UTF-8 -*-

def parse11(line):
    parameters = line.strip().split("\\1c")
    print "Transaction request"
    print "    Logical Unit Number (LUNO):\t\t{}".format(parameters[1][:3])
    if len(parameters[1]) == 9:
        print "    Machine No:\t\t\t\t{}". format(parameters[1][3:])
    if parameters[2]:
        print "    Unknown parameter:\t\t\t{}".format(parameters[2])
    print "    Time Variant Number (TVN):\t\t{}". format(parameters[3])
    print "    Top-Of-Form Flag:\t\t\t{}".format(parameters[4][0:1])
    print "    Message Coordiantion Number:\t{}".format(parameters[4][1:])
    print "    Track 2 Data:\t\t\t{}". format(parameters[5])
    if parameters[6]:
        print "    Track 3 Data:\t\t\t {}". format(parameters[6])
    print "    Operation Key Buffer:\t\t{}". format(parameters[7])
    print "    Dollar/Cents Keyborad Entry:\t{}". format(parameters[8].lstrip("0"))
    print "    Pin Buffer (Buffer A):\t\t{}". format(parameters[9])
    print "    MAC Data:\t\t\t\t{}\n". format(parameters[-1])

    
def parse4x(line):
    parameters = line.strip().split("\\1c")
    print parameters
    print "Function command"
    print "    Logical Unit Number (LUNO):\t\t{}".format(parameters[1][:3])
    if len(parameters[1]) == 9:
        print "    Machine No:\t\t\t\t{}". format(parameters[1][3:])    
    print "    Time Variant Number (TVN):\t\t{}". format(parameters[2])
    print "    Next State ID:\t\t\t{}". format(parameters[3])
    
    
    
    print

    

def main():
    for line in open("1.log"):
        
        if line[:3].isalpha():
            date = line
            
        if line.startswith("> 11"):
            print date.strip()
            parse11(line)
            
    
        if line.startswith("< 4"):
            print date.strip()
            parse4x(line)

    
    
if __name__ == "__main__":
    main()