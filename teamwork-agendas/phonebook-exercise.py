# Resource: https://www.guru99.com/reading-and-writing-files-in-python.html

def main():
# a+ : Open file in append mode. If file does not exist, it creates a new file. And '+' will open a file for reading and writing (updating)
    file1 = open('Myphonebook.txt', 'a+')
    file1.close
    print("\n    Phone Book Menu \n"+
          "Enter 1 To Find phone number\n" +
          "Enter 2 To Insert a phone number\n"+
          "Enter 3 To Delete a person from the phonebook\n"+
          "Enter 4 To Terminate\n**********************")

    choice = input("Enter your choice: ")

    if choice == "5":
        file1 = open("Myphonebook.txt", "r+")
        file_contents = file1.read()
        if len(file_contents) == 0:
            print("Phone Book is empty")
        else:
            print (file_contents)
        file1.close
        ent = input("Press Enter to continue ...")
        main()
    if choice == "1":
        search_contact_record()
        ent = input("Press Enter to continue ...")
        main()
​
    elif choice == "2":
        enter_contact_record()
        ent = input("Press Enter to continue ...")
        main()
    elif choice == "3":
        enter_contact_record()
        ent = input("Press Enter to continue ...")
        main()
    elif choice== "4":
        print("Terminated")
    else:
        print("Wrong choice, Please Enter [1 to 4]\n")
        ent = input("Press Enter to continue ...")
        main()
        
def search_contact_record():
    ''' This function is used to searches a specific contact record '''
    search_name = input("Enter First name for Searching contact record: ")
​
    search_name = search_name.title()
    file1 = open("Myphonebook.txt", "r+")
    file_contents = file1.readlines()
     
    found = False   
    for line in file_contents:
        if search_name in line:
            print("Your Required Contact Record is:", end=" ")
            print (line)
            found=True
            break
    if  found == False:
        print("There's no contact Record in Phone Book with name = " + search_name )
​
def enter_contact_record():
    ''' It  collects contact info firstname, last name, and phone '''
   
    first = input('Enter First Name: ')
    first = first.title()
    last = input('Enter Last Name: ')
    last = last.title()
    phone = input('Enter Phone number: ')
    contact = ("[" + first + " " + last + ", " + phone +  "]\n")
    file1 = open("Myphonebook.txt", "a")
    file1.write(contact)
    print( "This contact\n " + contact + "has been added successfully!")
​
main()















