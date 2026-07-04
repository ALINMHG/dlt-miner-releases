Dilithium Pool Miner — Linux (patched)
======================================

Requirements
------------
- This ZIP includes a pre-built binary — you do NOT need Go installed to mine.
- The miner is written in Go. Go is required only if you build from source
  yourself (Go 1.21+ from https://go.dev/dl/).

Install Go on Linux (build from source only)
--------------------------------------------
Skip this section if you only run the included dilithium-miner binary.

  wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go
  sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
  export PATH=$PATH:/usr/local/go/bin
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
  go version

Build from source (optional):

  git clone https://github.com/luccadimario/dilithiumcoin.git
  cd dilithiumcoin
  # apply patched pool_worker.go, then:
  go build -o dilithium-miner ./cmd/dilithium-miner

1. Edit mine-pool.sh:
   - MINER_ADDRESS = YOUR wallet (payout address)
   - POOL_HOST     = pool Stratum host:port
   - THREADS       = CPU threads

2. Run:
   chmod +x dilithium-miner mine-pool.sh
   ./mine-pool.sh

Do NOT use the pool operator wallet address here.
Use only this patched miner for public pools with MerkleRoot fix.

Manual run:
  ./dilithium-miner --pool HOST:3333 --miner=YOUR_ADDRESS --threads 4
