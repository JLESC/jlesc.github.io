import os

file = open('list_of_projects.txt', 'w')

filecut = os.listdir('./_projects')
filecut.remove('.placeholder')

for sFile in filecut:
    content = open('./_projects/'+ sFile, 'r')
    number = 1
    filename = ''
    membersfound = 0
    members = ''
    for line in content:
        if number == 3:
            filename = line.replace('title: ', '')
            filename = filename.replace('\n', '')
        elif line[0] == 'm':
            membersfound = 1
        elif membersfound == 1 and line.find('  -')!= -1:
            members = members + line
        elif membersfound == 1 and line.find('  -')== -1:
            membersfound = 0
        number = number+1
    name = sFile.replace('.md', '')
    members = members.replace("\n", '')
    members = members.replace("  -", '')
    file.write(name +" | " + filename  +" | " + members +"\n")

file.close()
content.close()
