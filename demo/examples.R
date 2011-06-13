require(RMendeley)

# You must enter your api key. To avoid passing it to each function use:
#options(MendeleyKey=UserAPIkey)

authors(discipline="6") # Discipline "6", Computer Science
details("10.1088/0953-8984/22/19/194101", type="doi")  
msearch("bob", 4, 20)

