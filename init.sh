#!/bin/bash

DEFAULT_PROJECT_ID="org.gtkmm.ApplicationTemplate"

read -p "ProjectID [default: $DEFAULT_PROJECT_ID]: " PROJECT_ID

if [[ ! $PROJECT_ID ]]
then
	PROJECT_ID=$DEFAULT_PROJECT_ID
fi

IFS="." read -a ID_PARTS <<< "$PROJECT_ID"

sed -i -e "s/_APPLICATION_ID_/$PROJECT_ID/g" CMakeLists.txt
sed -i -e "s/_PROJECT_NAME_/${ID_PARTS[-1]}/g" CMakeLists.txt

rm -rf .git*
rm -f README.md
rm -f init.sh

echo "Project initialized as '$PROJECT_ID'"
