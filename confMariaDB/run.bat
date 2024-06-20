call python -m pip install Jinja2
call python -m pip list

call python template.py -f ./ReferenceSetupDB.txt -t ./values.json -o ./DBSetup.sql 
call python template.py -f ./ReferenceEnv.php.txt -t ./values.json -o ./env.php 
