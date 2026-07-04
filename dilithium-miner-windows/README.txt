Dilithium Pool Miner — Windows (patched)
======================================

Requirements
------------
- This ZIP includes a pre-built binary — you do NOT need Go installed to mine.
- The miner is written in Go. Go is required only if you build from source
  yourself (Go 1.21+ from https://go.dev/dl/).

1. Edit mine-pool.bat:
   - MINER_ADDRESS = YOUR wallet (payout address)
   - POOL_HOST     = pool Stratum host:port
   - THREADS       = CPU threads

2. Double-click mine-pool.bat

Do NOT use the pool operator wallet address here.
Use only this patched miner for public pools with MerkleRoot fix.

Manual run:
  dilithium-miner.exe --pool HOST:3333 --miner=YOUR_ADDRESS --threads 4
