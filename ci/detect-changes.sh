#!/bin/sh
#1. Get commit range, we need 2 commits identifiers

#git diff $RANGE-COMMIT --name-only | sort -u | awk 'BEGIN {FS="/"} {print $4}' | paste -s -d, -

#Sample for just last commit
echo "Detecting project changes..."
projects=$(git diff HEAD~1 HEAD --name-only | awk 'BEGIN {FS="/"} {print $4}'| grep -v 'ci' | sort -u | paste -s -d, -)
if [ -z "$projects" ]; then
	echo "No project has changed"
	exit 1
fi
echo "Changes detected in... $projects"
echo "Writing changed-projects to changed-projects/projects.txt"
echo $projects > ../changed-projects/projects.txt