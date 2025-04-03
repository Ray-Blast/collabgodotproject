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

