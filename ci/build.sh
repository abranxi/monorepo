#1. Get commit range, we need 2 commits identifiers

#git diff $RANGE-COMMIT --name-only | sort -u | awk 'BEGIN {FS="/"} {print $4}' | paste -s -d, -

#Sample for just last commit
PROJECTS="$(git diff HEAD~1 HEAD --name-only | sort -u | awk 'BEGIN {FS="/"} {print $4}'| paste -s -d, -)"

#2. Use response as -pl parameter in maven build
mvn -pl $PROJECTS -amd clean install