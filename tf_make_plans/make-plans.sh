#!/bin/bash

for i in $*; do 
  cd $i; 
  echo "Init'ing for $i"
  terraform init
  echo "Making plan for: $i"
  if [ -f "./deploy" ]; then
   ./deploy plan -no-color | tee ../$i.plan.txt; 
  else  
   terraform plan -no-color | tee ../$i.plan.txt; 
  fi
  cd ../;
done


