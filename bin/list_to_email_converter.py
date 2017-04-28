# Idea:
# On the JLESC Website were personal informations, which should no longer stay there. Our idea was to create a personal
# link for every poject that fast on Google Forms. Every project leader gets a link. To implement this we want to
# create a file with the email address of the project leaders and their specific links. Additionally you can create a
# list with all project leaders.

# Usage:
# If you want to create the file with the links you have to specify which project you want to use. This could be files
# or folders or a mixture of both. If you want to update the mailing list, you have to use the flag -m. The program will
# tell you if there are new projects.

import os
from urllib.parse import quote
import sys
import argparse

# This is the input with argparse. The input must be at least one path with a file or folder, but it can also be more.
# The input will be saved in a list. If you want an update the projectleaders mailinglist you can use an positional
# argument.
parser = argparse.ArgumentParser()
parser.add_argument("-m","--mailinglist", help="when you want to update the mailinglist", action="store_true")
parser.add_argument("path",type=str, nargs= '+', help="the folderpath like: ./example/more/pytr")
user_input = parser.parse_args()

# All existing inputpathes are added to the filecut. If it is a folderpath every file from this folder is added to
# the filecut.
filecut=[]
for data in user_input.path:
    if os.path.isfile(data):
            if data.find('.md') != -1:
                filecut.append(data)

    else:
        if os.path.exists(data):
            for files in os.listdir(data):
                if files.endswith(".md"):
                    filecut.append(data+files)

# If the filecut is empty an errormessage is issued.
if not filecut:
    print('There are no files or folders that could be used.')
    sys.exit()

# For every file in the filecut the projectname and the members are retrieved and added to a dictionary.
bibfilemember = {}
for sFile in filecut:
    content = open(sFile, 'r')
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
    bibfilemember[filename] = members ## changed , to ;
    content.close()


people = []
head = []
realname= {}
link_pair = {}
# A list of the members is generated and a dictionary of this list and the projects.
for key, value in iter(bibfilemember.items()):
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
num_lines = sum(1 for line in open('../_data/people.yml'))


email = open('../_data/people.yml', 'r')

akt_lines=0

# The correct names of people are picked from the people database. From the projectleaders the emailadress is picked too.
# If the people database is in the wrong order the program starts again at top of the people database.
i=0
while i < len(people)-1:
    if people[i].find('*') != -1:
        people[i] = people[i].replace("*" , "")
        j=i+1
        # if one person is projectleader of more than one project
        while people[j].find('*') != -1 and people[i] == people[j].replace("*", "") :
            people[j] = people[j].replace("*", "")
            j= j+1
        while people[i]==people[i+1]:
            people.pop(i+1)
        # if one projectleader is involved in other projects
        while people[i] == people[i -1]:
            people.pop(i-1)
            i=i-1
        helpvar = 0
        name = ""
        emailaddress = ""
        endless = 0
        # checks email and real name of the projecleaders
        for line in email:
            akt_lines = akt_lines+1
            if (line ==''):
                if endless == 1:
                    print ("The person "+people[i]+" seems not to be in the people database!")
                    sys.exit()
                endless = 1
                email.close()
                email = open('../_data/people.yml', 'r')
            if line.find(people[i]+":")!= -1:
                endless = 0
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
        realname[people[i]] = name +' ('+people[i]+')'
        i=i+1

    else:
        while people[i] == people[i + 1]:
            people.pop(i+1)
        # if one person is projectleader
        if people[i+1].find('*') != -1 and people[i] == people[i+1].replace("*", ""):
            i=i+1
            continue
        helpvar = 0
        name = ""
        endless = 0
        # checks the real names of the persons
        for line in email:
            akt_lines = akt_lines + 1
            if (line == ''):
                if endless == 1:
                    print("The person " + people[i] + " seems not to be in the people database!")
                    sys.exit()
                email.close()
                email = open('../_data/people.yml', 'r')
                endless = 1
            if line.find(people[i] + ":") != -1:
                helpvar = 1
                endless = 0
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
        realname[people[i]]= name +' ('+people[i]+')'
        i=i+1

email.close()

# If the user wants an update of the projectleaders mailinglist
if user_input.mailinglist:
    datei = open("projectleader_mailinglist.txt", "w")
    variableemails = ""
    for element in head:
        variableemails = variableemails + element[2] +", "
    variableemails = variableemails[:-2]
    variableemails = variableemails.rstrip()
    datei.write(variableemails)
    datei.close()

# If there are old links these will entered in a list for a later comparsion.
comparsion =[]
if os.path.isfile('mailinglist_pms.txt'):
    file = open('mailinglist_pms.txt', 'r')
    for line in file:
        line = line .split(" ")
        line[1] = line[1][:-1]
        if line[1] != "Link":
            comparsion.append(line[1])


file = open('mailinglist_pms.txt', 'w')
file.write("Head; Link\n")

# The link is generated and written into a file like: emailadress of the projectleader, link
for key, value in iter(link_pair.items()):
    #If you want to change the link the [projectname] and [pms] are essential!
    link = "https://docs.google.com/forms/d/e/1FAIpQLScGSWaftv79a0sokGWAF9tiVRUdukQPPAdkOnQwXR4w116L-w/viewform?usp=pp_url&entry.945436707=[projectname]&entry.297499208=[pms]"

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

    # If there is a new project this one wil be displayed on the screen
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
