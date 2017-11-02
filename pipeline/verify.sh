#!/bin/sh
echo "Executing tests..."
projects=$(cat ../changed-projects/projects.txt)

cd practice-objectives/FY18-Q2/monorepo
mvn -pl $projects -amd -am clean verify

if [ $? -ne 0 ]; then
  exit 1
fi