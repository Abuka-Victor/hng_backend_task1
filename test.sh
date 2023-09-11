#!/bin/bash

[[ -z "$1" ]] && { echo "Err: Usage -> './test.sh prod' or './test.sh dev PORT' for help use './test.sh help'" ; exit 1; }

if [ $1 = 'help' ]; then
	echo "This is a script that is used to test the API. 

This  should:

Add a new person (e.g., "Mark Essien").

Fetch details of a person

Modify the details of an existing person.

Remove a person

./test.sh prod
when you pass prod as a parameter, it will use the production api to test

./test.sh dev PORT
When you pass dev as a parameter as well as the port your server is running on,
it will use the local api to test - this goes without saying
you should have setup the local api before running this script
"
fi

if [ $1 = 'prod' ]; then
http_response=$(curl -s -o response.txt -w "%{http_code}" https://backend-task1-g9t6.onrender.com/api)
if [ $http_response != "200" ]; then
    echo "Failed get all request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" -X POST -H 'Content-Type: application/json' -d '{"name": "mark"}' https://backend-task1-g9t6.onrender.com/api)
if [ $http_response != "201" ]; then
    echo "Failed create person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" https://backend-task1-g9t6.onrender.com/api/mark)
if [ $http_response != "200" ]; then
    echo "Failed get person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" -X PATCH -H 'Content-Type: application/json' -d '{"name": "john"}' https://backend-task1-g9t6.onrender.com/api/mark)
if [ $http_response != "200" ]; then
    echo "Failed update person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" -X DELETE -H 'Content-Type: application/json' https://backend-task1-g9t6.onrender.com/api/john)
if [ $http_response != "202" ]; then
    echo "Failed delete person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

fi


# DEVELOPMENT


if [ $1 = 'dev' ]; then
	http_response=$(curl -s -o response.txt -w "%{http_code}" http://127.0.0.1:$2/api)
if [ $http_response != "200" ]; then
    echo "Failed get all request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" -X POST -H 'Content-Type: application/json' -d '{"name": "mark"}' http://127.0.0.1:$2/api)
if [ $http_response != "201" ]; then
    echo "Failed create person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" http://127.0.0.1:$2/api/mark)
if [ $http_response != "200" ]; then
    echo "Failed get person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" -X PATCH -H 'Content-Type: application/json' -d '{"name": "john"}' http://127.0.0.1:$2/api/mark)
if [ $http_response != "200" ]; then
    echo "Failed update person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

http_response=$(curl -s -o response.txt -w "%{http_code}" -X DELETE -H 'Content-Type: application/json' http://127.0.0.1:$2/api/john)
if [ $http_response != "202" ]; then
    echo "Failed delete person request"
    echo "$http_response"
else
    echo "Server returned:"
    cat response.txt
    $(rm -f response.txt)
    echo -e "\n-------------PASSED------------------"   
fi

fi