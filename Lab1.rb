#Annie Lee
#CIS 196
#February 6th, 2011
#Ruby Lab 1

#Step 10: my_array method
def my_array
  a = [0,10,20,30,40,50,60,70,80,90,100]
  a.delete_if {|x| x >= 50 }
  a.each {|x| print x, " "}
end

my_array
print "\n"

#Step 12: double_open method
def double_open
  f1 = File.open("file1.txt")
  f2 = File.open("file2.txt")
  until f1.eof or f2.eof
    l1 = f1.readline
    l1 = l1.rstrip
    l2 = f2.readline
    l2 = l2.rstrip
    print l1 + "|" + l2 + "\n"
  end
  f1.close
  f2.close
end

double_open
