#!/bin/bash

echo "=========="
echo "Configuration Complete"
echo ""
if [ -f /root/.new_rsa ]
then
  echo "Ensure that you clone the example core_repo and make it PRIVATE using bitbucket"
  echo ""
  echo "Add the following PublicKey to allow the Puppetserver to pull your Core_Repo:"
  echo ""
  cat /root/.ssh/id_rsa.pub
  echo ""
  echo "Once this key has been added as a deployment key to your Repository, please run"
  echo "docker stop" $(cat /proc/self/cgroup | grep "cpu:/" | sed 's/\([0-9]\):cpu:\/docker\///g')
  echo "docker start" $(cat /proc/self/cgroup | grep "cpu:/" | sed 's/\([0-9]\):cpu:\/docker\///g')
  echo ""
  rm /root/.new_rsa
fi
echo "=========="
