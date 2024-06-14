# Contributing to `HaskeWW`

Contributing has never been \*easier\*! If you have a `Haskell` project that
you believe demonstrates the language's capabilities, follow these steps:

1. Fork the repository.
2. Clone your fork to you preferred environment.
3. **Adding a project to the repository**: this can be done manually or by
   using a nifty script that we provide. You can type the following (from the
   root of the repository) on any `POSIX`-compliant shell:

   ```sh
   ./add-project.sh
   ```

> [!IMPORTANT]
> Trusting unknown scripts is, indeed, **dangerous** (and highly discouraged).
> So, before you run the script, make sure you read this section. The 
> script will reset the `README.md` file, ask the user for new project's name,
> link, description, and sort the projects alphabetically. The core of the
> functionality is written, of course, in `Haskell`. The source code is fully
> available in the repository.
> > However, if you don't feel like bothering with `cabal` and prefer having
> > a dependency-free (sort of) script on the go, you can pass `--no-cabal` to
> > the script and it will invoke the same functionality, this time, however,
> > in `Python` (should you have it installed).

> [!NOTE]  
> If you decide to add a project manually, make sure to follow the structure
> currently in place.

4. Commit and push your changes to your fork.
5. Open a new pull request and tag the maintainer(s) in the PR.
6. Wait for the maintainer(s) to review your changes.
7. If everything is in order, your project will be merged into the repository.

