import os
from urllib.parse import quote
import sys
import argparse

user_input = input("Write the path of your file or folder: ")

if user_input.find('.md') != -1:
    print("THis is not a folder. It is an .md file!")
elif not os.path.exists(user_input):
    print("This folder ist no folder or is not available!")
else:
    whynot = {}

    filecut = []

    for files in os.listdir(user_input):
        if files.endswith(".md"):
            filecut.append(files)
    #muss noch veraendert werden

    for sFile in filecut:
        content = open(user_input +'/'+ sFile, 'r')
        filename = ''
        membersfound = 0
        members = ''
        count = 0
        for line in content:
            if line.find('title:')!= -1:
                filename = line.replace('title: ', '')
                filename = filename.replace('\n', '')
            elif line.find('head:') != -1:
                 members = members + line.replace('head: ', '')
            elif line.find('members:') != -1:
                membersfound = 1
            elif membersfound == 1 and line.find('  -')!= -1:
                members = members + line
            elif membersfound == 1 and line.find('  -')== -1:
                membersfound = 0
            elif line.find('---') != -1:
                count = count +1
                if count == 2:
                    break
        name = sFile.replace('.md', '')
        members = members.replace("\n", '')
        members = members.replace("  -", '')
        whynot[filename] = members ## changed , to ;
        content.close()

    people = []
    head = []
    realname= {}
    link_pair = {}

    for key, value in iter(whynot.items()):
        project = quote(key)

        names = value.split(" ")
        pms = []
        names[0] = names[0]+"*" ##for the head
        for object in names:
            if(object != ""):
                pms.append(object)
                people.append(object)
        link_pair[project]=pms


    people = sorted(people)
    people.append("buffer") ##buffer element for loop
    num_lines = sum(1 for line in open('_data/people.yml'))


    email = open('_data/people.yml', 'r')

    akt_lines=0

    i=0
    while i < len(people)-1:
        if people[i].find('*') != -1:
            people[i] = people[i].replace("*" , "")
            j=i+1
            while people[j].find('*') != -1 and people[i] == people[j].replace("*", "") :
                people[j] = people[j].replace("*", "")
                j= j+1
            ## if one person is projectleader of more than one project
            while people[i]==people[i+1]:
                people.pop(i+1)
            while people[i] == people[i -1]:
                people.pop(i-1)
                i=i-1
            ## if one projectleader is involved in other projects
            helpvar = 0
            name = ""
            emailaddress = ""
            for line in email:
                akt_lines = akt_lines+1
                if (line ==''):
                    email.close()
                    email = open('_data/people.yml', 'r')
                if line.find(people[i]+":")!= -1:
                    helpvar = 1
                elif helpvar > 0 and line.find('  sur_name:') != -1:
                    name = name + line.replace("  sur_name: ", "").rstrip()
                    helpvar = helpvar + 1
                elif helpvar > 0 and line.find('  given_name:') != -1:
                    name = line.replace("  given_name: ", "").rstrip() + " " + name
                    helpvar = helpvar + 1
                elif helpvar > 0 and line.find('  email:') != -1:
                    if(line == "  email:\n" or line == "  email: \n"):
                        print(name +" has no Emailaddress.")
                        emailaddress = "!!! "+ name + " HAS NO EMAILADDRESS!!!"
                    else:
                        emailaddress = line.replace("  email: ", "").rstrip()
                    helpvar = helpvar + 1
                elif helpvar == 4:
                    name = name.replace("  "," ")
                    break
                if (akt_lines >= num_lines):
                    email.seek(0)
                    akt_lines = 0

            head.append([people[i], name, emailaddress])
            realname[people[i]] = name
            i=i+1
            ## checks email and real name of the projecleaders

        else:
            while people[i] == people[i + 1]:
                people.pop(i+1)
            if people[i+1].find('*') != -1 and people[i] == people[i+1].replace("*", ""):
                i=i+1
                continue
                ## if one person is projectleader
            helpvar = 0
            name = ""
            for line in email:
                akt_lines = akt_lines + 1
                if (line == ''):
                    email.close()
                    email = open('_data/people.yml', 'r')
                if line.find(people[i]) != -1:
                    helpvar = 1
                elif helpvar > 0 and line.find('  sur_name:') != -1:
                    name = name + line.replace("  sur_name:", "").rstrip()
                    helpvar = helpvar + 1
                elif helpvar > 0 and line.find('  given_name:') != -1:
                    name = line.replace("  given_name: ", "").rstrip() + " " + name
                    helpvar = helpvar + 1
                elif helpvar == 3:
                    name = name.replace("  ", " ")
                    break
                if (akt_lines >= num_lines):
                    email.seek(0)
                    akt_lines = 0
            realname[people[i]]= name
            i=i+1
            ## checks the real names of the persons

    #print (people)
    #print (head)
    #print (realname)

    email.close()

    datei = open("projectleader_mailinglist.txt", "w")
    blabla = ""
    for element in head:
        blabla = blabla + element[2] +", "
    blabla = blabla[:-2]
    blabla = blabla.rstrip()
    datei.write(blabla)

    datei.close()
    comparsion =[]
    file = open('mailinglist_pms.txt', 'r')
    for line in file:
        line = line .split(" ")
        line[1] = line[1][:-1]
        if line[1] != "Link":
            comparsion.append(line[1])


    file = open('mailinglist_pms.txt', 'w')
    file.write("Head; Link\n")

    for key, value in iter(link_pair.items()):
        link = "https://docs.google.com/forms/d/1HtvPVp-oCxFACzIgJD49g5qXjt8otU9YIalt-GOCIAg/viewform?entry.1218238180=[projectname]&entry.703889404=[pms]"

        varname =""
        link = link.replace("[projectname]", key)
        endung = quote(": 0.0 PMs")
        persons = ""
        for item in value:
            if (item.find('*') != -1):
                item = item.replace("*", "")
                for objects in head:
                    if( objects[0] == item):
                        if objects[2].startswith(" ") != -1:
                            objects[2] = objects[2].lstrip()
                        varname = objects[2]
                        file.write(objects[2] + "; ")
                        break
            persons = persons + quote(realname[item]) + endung + "%0A"

        link = link.replace("[pms]", persons)
        var = -1
        for item in comparsion:
            if link == item:
                var = 1
                comparsion.remove(item)
                break
        if var == -1:
            print("NEW PROJECT: " +varname +" " +link )

        file.write(link + "\n")