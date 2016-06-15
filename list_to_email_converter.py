from urllib.parse import quote

list = open('list_of_projects.txt', 'r')
file = open('mailinglist_pms.txt', 'w')
email = open('_data/people.yml', 'r')

head = []

for line in list:

    link = "https://docs.google.com/forms/d/1HtvPVp-oCxFACzIgJD49g5qXjt8otU9YIalt-GOCIAg/viewform?entry.1218238180=[projectname]&entry.703889404=[pms]"
    zeile = line.split(';')

    if zeile[1].startswith(" "):
        zeile[1] = zeile[1].lstrip()
    if zeile[2].startswith(" "):
        zeile[2] = zeile[2].lstrip()
    if zeile[2].endswith("\n"):
        zeile[2] = zeile[2].rstrip()

    project = quote(zeile[1])

    names = zeile[2].split(" ")
    pms = ""
    for object in names:
        if(object != ""):
            object = quote(object)
            pms = pms + object + ":+0.0PMs%0A"

    link = link.replace("[projectname]", project)
    link = link.replace("[pms]", pms)

    file.write("Project: " + zeile[0] + " ; Head: " + names[0] + " ; Link: "+ link +"\n")

    head.append(names[1])


file.close()
list.close()
email.close()
