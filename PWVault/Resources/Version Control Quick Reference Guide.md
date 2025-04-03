
## Git CLI

The main program that you will invoke when version controlling. Make sure you are in the specified directory before invoking any of the commands or it will error out/cause other issues.

**git** 
- command to invoke the git CLI

git clone (.git https address)
- command that retrieves all of the files of a repository and makes a new directory of it into your local

git status
- command that lists all the changes, modifications, additions, or lack thereof since last commit

git add \filepath
- command to add a specific file for versioning

git add -A
- command to add everything that has been changed, created, or modified since last commit

git commit -m "message"
- command that encapsulates all of the additions to git in a single object. Must always incorporate a message that hopefully somewhat alludes to what has been changed.

git push (remote) (branch)
- command that pushes your commits to the specified remote/branch
	- Example: **git push origin master**
		- pushes all of your changes to master branch

git pull (remote) (branch)
- command that updates your local based on the branch specified
	- Example: git pull origin master
		- updates all of your changes to include files from master branch

git checkout (branch)
- command that lets you switch were your current branch is pointing to
	- Example: **git checkout RatBranch**
		- switches to the branch known as "RatBranch"

git checkout -b (newBranchName)
- command that creates a new branch and switches to it

git log
- command that prints recent commit/pushes
	- to exit log press q
	- you can limit this by doing git log -n (number of commits to view)


### Read more: Git
https://www.atlassian.com/git/glossary#terminology

## GH CLI

There may be times you want to specifically call GitHub centered commands. In which case make sure you have the [GitHub CLI installed](https://cli.github.com/) and authenticated.

gh
- command to invoke the GitHub CLI

gh auth
- command to authenticate yourself your local to your GitHub account

gh repo create
- command that will create a new repository from scratch, push an exisiting git repo, or else

gh pr create (subcommands)
- command that will create a pull request from the command line
- Example: **gh pr create --title "Test pr" --body "This is a test for creating a pr" --reviewer Ray-Blast
	- this will create a pull request with a set title, body, and asking someone to review the pull request
	- you can choose not to include those, and command will allow you to add them in a follow up input prompt
	- you can choose to open up the pr manager in the browser by doing **gh pr create --web**

### Read More: GH
https://cli.github.com/manual/gh
