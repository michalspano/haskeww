#!/usr/bin/env python3

from json import load

if __name__ == "__main__":
    try:
        # Load the already existing projects.
        with open("projects.json") as f:
            projects = load(f)['projects']
            
            # Sort them by the "name" attribute
            projects.sort(key=lambda p: p["name"])
            with open("README.md", "a") as readme:
                for proj in projects:
                    # Write each line in the desired Markdown format (i.e. Embedded
                    # link with a description).
                    line = f"- [{proj['name']}]({proj['link']}) - {proj['desc']}\n"
                    readme.write(line)

    except KeyboardInterrupt:
        print("\nInterrupted.")
    
