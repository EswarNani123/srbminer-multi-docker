#!/bin/bash
echo "Start SRBMiner-MULTI with Parameters: --algorithm $ALGO --pool $POOL_ADDRESS --wallet DOGE:$WALLET_USER.$HOSTNAME#Jumper --password $PASSWORD"
./SRBMiner-MULTI --algorithm $ALGO --pool $POOL_ADDRESS --wallet DOGE:$WALLET_USER.$HOSTNAME#Jumper --password $PASSWORD
