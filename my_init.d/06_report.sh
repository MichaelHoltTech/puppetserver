#!/bin/bash

echo "=========="
echo "Configuration Complete"
echo ""
echo "Ensure that you clone the example core_repo and make it PRIVATE using bitbucket"
echo ""
echo "Add the following PublicKey to allow the Puppetserver to pull your Core_Repo"
echo ""
cat /root/.ssh/id_rsa.pub
echo ""
if [ -f /root/.new_rsa ]; then
  echo "It appears that the SSH Key has been regenerated.  Please verify that your core_repo"
  echo "has the correct key configured for R10K to work"
  rm /root/.new_rsa
fi
echo "=========="
