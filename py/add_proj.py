#!/usr/bin/env python3

from json import dump, load

if __name__ == "__main__":
    try:
        print("Adding a new project to the repo...")
        # Read the user data
        name = input("What's the name of the project?\n> ")
        link = input("What's a link to the project?\n> ")
        desc = input("Description of the project?\n> ")
        
        # Load the already existing projects.
        with open("projects.json") as f:
            projects = load(f)['projects']
        
        # Aim to reset the file, add the new entry with already existing projects.
        with open("projects.json", "w") as f:
            # Create new instance.
            projects.append({ "name": name, "link": link, "desc": desc })
            # Wraper around the "projects" attribute.
            project_wrapper = { "projects": projects }
            dump(project_wrapper, f, indent=2) # write

    except KeyboardInterrupt:
        print("\nInterrupted.")
