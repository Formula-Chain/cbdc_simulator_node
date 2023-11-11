# Use Hyperledger Besu's latest image as the base
FROM hyperledger/besu:latest

# Set working directory
WORKDIR /opt/besu

# Copy your genesis file into the container
COPY genesis.json /opt/besu/genesis.json

# Copy any other necessary files or configurations
# COPY <your_local_path> <container_path>

# Expose necessary ports
EXPOSE 8545 30303

# Define the entrypoint script
ENTRYPOINT ["/bin/bash", "-c"]
CMD ["/opt/besu/bin/besu --data-path=/opt/besu/data --genesis-file=/opt/besu/genesis.json --bootnodes=$ENODE_URL --rpc-http-enabled --rpc-http-cors-origins=\"*\" --rpc-http-api=ADMIN,ETH,NET,PERM,QBFT --host-allowlist=\"*\""]
