list = open('list_of_projects.txt', 'r')
file = open('mailinglist_pms.txt', 'w')
email = open('_data/people.yml', 'r')

for line in list:

    link = "https://docs.google.com/forms/d/1HtvPVp-oCxFACzIgJD49g5qXjt8otU9YIalt-GOCIAg/viewform?entry.1218238180=[projectname]&entry.703889404=[pms]"
    zeile = line.split(';')

    if zeile[1].startswith(" "):
        zeile[1] = zeile[1].lstrip()
    if zeile[2].startswith(" "):
        zeile[2] = zeile[2].lstrip()
    if zeile[2].endswith("\n"):
        zeile[2] = zeile[2].rstrip()

    project = zeile[1]
    project = project.replace("%", "%25")
    project = project.replace("+", "%2B")
    project = project.replace("\\", "%5C")
    project = project.replace("\"", "%22")
    project = project.replace("`", "%60")
    project = project.replace("<", "%3C")
    project = project.replace(">", "%3E")
    project = project.replace("[", "%5B")
    project = project.replace("]", "%5D")
    project = project.replace("{", "%7B")
    project = project.replace("}", "%7D")
    project = project.replace("|", "%7C")
    project = project.replace("=", "%3D")
    project = project.replace("&", "%26")
    project = project.replace("^", "%5E")
    project = project.replace("#", "%23")
    project = project.replace(" ", "+")
    project = project.replace("++", "+")

    names = zeile[2].split(" ")
    pms = ""
    for object in names:
        if(object != ""):
            pms = pms + object + ":+0.0PM%60s%0A"

    link = link.replace("[projectname]", project)
    link = link.replace("[pms]", pms)

    file.write("Project: " + zeile[0] + " ; Head: " + names[0] + " ; Link: "+ link +"\n")
