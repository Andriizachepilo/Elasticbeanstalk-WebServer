#!/bin/bash

cd app

package=("app.js" "package.json" ".env")
app=()
output=$(node myscript.js)


for files in *; do 
    if [[ -d $files ]]; then
        package+=("$files")
    elif [[ $files == *.zip ]]; then
        app+=("$files")
    fi
done

if [[ -e ".env" && -s ".env" ]]; then 

    if [[ "$output" == *"MongoDB connected..."* ]]; then
        echo "MongoDB url is correct!"

        read -p "Do you want to zip the app to prepare it for deployment to Elastic Beanstalk? (y/n): " answer

        if [[ "$answer" == "y" || "$answer" == "Y" ]]; then

            for zip_file in "${app[@]}"; do
                if [[ -e "$zip_file" ]]; then
                    rm "$zip_file"
                fi
            done

            zip -r app.zip "${package[@]}"

            read -p "Your app is ready for deployment with Terraform. Do you want to terraform apply? (y/n): " terraform_answer

            if [[ "$terraform_answer" == "y" || "$terraform_answer" == "Y" ]]; then
                cd ../terraform
                terraform apply -auto-approve
            fi
        fi
    else 
        echo "Unable to connect to the MongoDB database. Please check your MongoDB URL"
    fi
else 
    echo "The .env file is either missing or empty. Please ensure it exists and contains valid configuration"
fi
