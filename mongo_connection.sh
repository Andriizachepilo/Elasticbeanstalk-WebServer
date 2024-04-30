#!/bin/bash

cd app

output=$(node myscript.js)
files_for_zip=("routes" "config" "helpers" "models" "views" "public" "app.js" "package.json" ".env" )

if [[ "$output" == *"MongoDB connected..."* ]]; then
    echo "MongoDB url is correct!"

if [ -e "app.zip" ]; then
rm "app.zip"

fi
zip -r app.zip "${files_for_zip[@]}"

fi
cd ../terraform
terraform apply 

else 
echo "############################ MONGODB URL IS NOT CORRECT ######################################"
fi











