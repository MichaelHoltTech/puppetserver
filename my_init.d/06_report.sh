#!/bin/bash

echo "=========="
echo "Configuration Complete"
echo ""
echo "Ensure that you clone the example core_repo and make it PRIVATE using bitbucket"
echo ""
if [ -f /root/.ssh/id_rsa.pub ]; then
  echo "Add the following PublicKey to allow the Puppetserver to pull your Core_Repo"
  echo ""
  cat /root/.ssh/id_rsa.pub
  echo ""
else
  echo "You have specified an existing Private Key.  Please ensure you add the public key"
  echo "to your core_repo deployment keys to allow R10K to work"
  echo ""
fi
if [ -f /root/.new_rsa ]; then
  echo "It appears that the SSH Key has been regenerated.  Please verify that your core_repo"
  echo "has the correct key configured for R10K to work"
  echo ""
  rm /root/.new_rsa
fi
echo "=========="
