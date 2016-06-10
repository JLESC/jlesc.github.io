import os

file = open('list_of_projects.txt', 'w')

filecut = []

for files in os.listdir('./_projects'):
    if files.endswith(".md"):
        filecut.append(files)


for sFile in filecut:
    content = open('./_projects/'+ sFile, 'r')
    filename = ''
    membersfound = 0
    members = ''
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
    name = sFile.replace('.md', '')
    members = members.replace("\n", '')
    members = members.replace("  -", '')
    file.write(name +" , " + filename  +" , " + members +"\n")

file.close()
content.close()


