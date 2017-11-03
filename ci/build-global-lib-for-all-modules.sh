#!/bin/sh
git clone git-repo-all git-repo-all-out
NEW_VERSION=$(cat global-lib-version/version)
echo "Setting new global-lib-for-all-modules module version to $NEW_VERSION..."
mvn -Dmaven.repo.local=maven-cache -s git-repo-all-out/ci/settings.xml -f git-repo-all-out/global-lib-for-all-modules/pom.xml versions:set -DnewVersion=$NEW_VERSION -DgenerateBackupPoms=false -DoldVersion='*'
echo "Building global-lib-for-all-modules module..."
mvn -Dmaven.repo.local=maven-cache -s git-repo-all-out/ci/settings.xml -f git-repo-all-out/global-lib-for-all-modules/pom.xml clean install
echo "Moving jar to output folder..."
mv git-repo-all-out/global-lib-for-all-modules/target/*.jar global-output/
echo "Cleaning..."
mvn -Dmaven.repo.local=maven-cache -s git-repo-all-out/ci/settings.xml -f git-repo-all-out/global-lib-for-all-modules/pom.xml clean
echo "Commiting changes..."
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
cd git-repo-all-out
git add .
git commit -m "[ci skip] New global-lib-for-all-modules module version $NEW_VERSION"
