#!/bin/sh
#git clone git-repo-all git-repo-all-out
NEW_VERSION=$(cat global-lib-version/version)
echo "Setting new global-lib-for-all-modules module version to $NEW_VERSION..."
mvn -s git-repo-all/ci/settings.xml -f git-repo-all/global-lib-for-all-modules/pom.xml versions:set -DnewVersion=$NEW_VERSION -DgenerateBackupPoms=false -DoldVersion='*'
echo "Building global-lib-for-all-modules module..."
mvn -s git-repo-all/ci/settings.xml -f git-repo-all/global-lib-for-all-modules/pom.xml clean install
echo "Moving jar to output folder..."
mv git-repo-all/global-lib-for-all-modules/target/*.jar global-output/
echo "Cleaning..."
mvn -s git-repo-all/ci/settings.xml -f git-repo-all/global-lib-for-all-modules/pom.xml clean
echo "Commiting changes..."
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
#mkdir -p ~/.ssh/
#touch ~/.ssh/known_hosts
#ssh-keyscan github.com >> ~/.ssh/known_hosts
cd git-repo-all
git add .
git commit -m "[ci skip] New global-lib-for-all-modules module version $NEW_VERSION"
#echo "Creating new tag global-lib-v$NEW_VERSION..."
#git tag -a global-lib-v$NEW_VERSION -m "New global-lib-for-all-modules module version $NEW_VERSION"
#git push origin global-lib-v$NEW_VERSION
#cd ../git-repo-all
#git push origin global-lib-v$NEW_VERSION
cd ..
