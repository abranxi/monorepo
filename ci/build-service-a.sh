#!/bin/sh
git clone git-repo-all git-repo-all-out
NEW_VERSION=$(cat service-a-version/version)
echo "Setting new service-a module version to $NEW_VERSION..."
mvn -s git-repo-all-out/ci/settings.xml -f git-repo-all-out/service-a/pom.xml versions:set -DnewVersion=$NEW_VERSION -DgenerateBackupPoms=false -DoldVersion='*'
echo "Building service-a module..."
mvn -s git-repo-all-out/ci/settings.xml -f git-repo-all-out/service-a/pom.xml clean install
echo "Moving jar to output folder..."
mv git-repo-all-out/service-a/target/*.jar global-output/
echo "Cleaning..."
mvn -s git-repo-all-out/ci/settings.xml -f git-repo-all-out/service-a/pom.xml clean
echo "Commiting changes..."
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
cd git-repo-all-out
git add .
git commit -m "[ci skip] New service-a module version $NEW_VERSION"
