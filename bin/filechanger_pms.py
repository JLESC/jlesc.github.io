# Idea:
# On the JLESC Website were personal informations, which should no longer stay there. But they are essentail for the
# annual report. With the help of the list_to_email_converter.py The project leader should have completed a
# survey. From this survey we get a .csv file. This one is a local file and is not allowed to upload on
# Github. The program will write the personal informations, we get from the .csv file into the project files.

# Usage:
# Your input should be the .csv file from the JLESC survey. The output file is as standard ./_projects/. If you want
# to use an other folder you have to specify this one. This folder do not has to exist.
# With this program you are only allowed to work on your local copy. Also the output is not allowed to
# upload on Github.



import csv
import os
import argparse

# This is the input with argparse. The output is optional. The input should be the .csv file from the JLESC survey.
parser = argparse.ArgumentParser()
parser.add_argument("input",type=str, help="The path of the input. It has to be a .csv.")
parser.add_argument("--output",type=str, nargs='?', default='./_projects/', help="The folder with the output. If there is no folder given the program will create _projects in the current folder.")
parser.add_argument("--projects",type=str, default='../_projects/', help="The path of the project folder.")
user_input = parser.parse_args()

# To change the date easier
date = '2016/2017'

# If the outputfolder does not exist, this will generate a new one.
if not os.path.exists(user_input.output):
    os.makedirs(user_input.output)

# It is checkes whether it is a .csv, it is a real file and it is not not empty
if user_input.input.find('.csv')!= -1 and os.path.isfile(user_input.input) and os.stat(user_input.input).st_size != 0:

    # The input is saved in a list and the first element is deleted
    reader = csv.reader(open(user_input.input))
    projects=[]
    for row in reader:
        projects.append(row)
    projects = projects[1:]

    # The ./_projects/ folder is the outboxfolder. As long as there is an entry in the projectslist, every file will be checked.
    for data in os.listdir(user_input.projects):
        file = open(user_input.projects+data ,'r')
        text=''
        # The text from each file is first added to a string
        for line in file:
            text=text+line
            if line.find('title:')!= -1:
                help = line.replace('title:', '')
                found = 0
                # When a file has the right projectname the person month effort is added to the text.
                for objects in projects:
                    if help.find(objects[1]) != -1:
                        found=1
                        for line2 in file:
                            # If there is an old person month effort this will be skipped and is not added to the text.
                            if line2.find('## Person-Month efforts in ') != -1:
                                for line3 in file:
                                    if line3.find('## Future plans') != -1:
                                        line2 = line3
                                        break
                            # The person month effort is added in front of the future plans. After this the remaining text is added.
                            if line2.find('## Future plans')!=-1:
                                line2=' \n'+line2 # \n you need to have the free line befor
                                text=text+'## Person-Month efforts in ' + date + '\n\n{:.person-months-table.table.table-bordered.table-hover.table-sm}\n' ## here is a problem with the years!!!
                                var=0
                                for letter in objects[2]:
                                    if letter == '(':
                                        text=text+'| {% person '
                                        var=1
                                    elif letter == ')':
                                        text=text+' %}    | '
                                        var=2
                                    elif var==1:
                                        text=text+letter
                                    elif var==2:
                                        if letter.isdigit() or letter=='.':
                                            text=text+letter
                                        elif letter == "\n":
                                            var=0
                                            text=text+' PM |\n'
                            text = text + line2
                        projects.remove(objects)
                # If the project was not in the input the text will be deleted.
                if found == 0:
                    text=''
                    break
        file.close()
        # If the text is not empty in the outputfolder will be the new files.
        if text:
            file = open(user_input.output +'/'+ data, 'w')
            file.write(text)

    # If there is any project left an errormessage will be generated
    if projects:
        for things in projects:
            print('The '+ things[1]+' project does not exist. You should check that!')


else:
    print('Your input is not an existing file or is no .csv or is empty')
