Dilithium Pool Miner — Linux (patched)
======================================

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
