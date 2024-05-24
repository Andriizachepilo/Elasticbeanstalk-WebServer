#!/bin/bash

cd app

output=$(node myscript.js)
files_for_zip=("routes" "config" "helpers" "models" "views" "public" "app.js" "package.json" ".env" "node_modules" )
app="appjs.zip"


if [[ -e ".env" && -s ".env" ]]; then 

    if [[ "$output" == *"MongoDB connected..."* ]]; then
        echo "MongoDB url is correct!"

       read -p "Do you want to zip the app to prepare it for deployment to Elastic Beanstalk? (y/n): " answer

        if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
        
            if [[ -e "$app" ]]; then
                rm "$app"
            fi

            zip -r "$app" "${files_for_zip[@]}"

            cd ../terraform
            terraform apply
        fi
    else 
        echo "############################ MONGODB URL IS NOT CORRECT ######################################"
    fi
fi












