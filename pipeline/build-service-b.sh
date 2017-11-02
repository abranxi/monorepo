#!/bin/sh
git clone git-repo-all git-repo-all-out
NEW_VERSION=$(cat service-b-version/version)
echo "Setting new service-b module version to $NEW_VERSION..."
mvn -s git-repo-all-out/practice-objectives/FY18-Q2/monorepo/pipeline/settings.xml -f git-repo-all-out/practice-objectives/FY18-Q2/monorepo/service-b/pom.xml versions:set -DnewVersion=$NEW_VERSION -DgenerateBackupPoms=false -DoldVersion='*'
echo "Building service-b module..."
mvn -s git-repo-all-out/practice-objectives/FY18-Q2/monorepo/pipeline/settings.xml -f git-repo-all-out/practice-objectives/FY18-Q2/monorepo/service-b/pom.xml clean install
echo "Moving jar to output folder..."
mv git-repo-all-out/practice-objectives/FY18-Q2/monorepo/service-b/target/*.jar global-output/
echo "Cleaning..."
mvn -s git-repo-all-out/practice-objectives/FY18-Q2/monorepo/pipeline/settings.xml -f git-repo-all-out/practice-objectives/FY18-Q2/monorepo/service-b/pom.xml clean
echo "Commiting changes..."
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
cd git-repo-all-out
git add .
git commit -m "[ci skip] New service-b module version $NEW_VERSION"