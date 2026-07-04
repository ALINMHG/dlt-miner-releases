# Dilithium Pool Miner (patched)

Patched `dilithium-miner` for mining on **public Stratum pools** after the MerkleRoot fork (block 6000+).

Required for pools that send deterministic work (fixed timestamp, Merkle root, coinbase). The official miner from GitHub **will not** find valid blocks on these pools.

## Downloads

| Platform | File |
|----------|------|
| Windows 64-bit | [dilithium-miner-windows.zip](./dilithium-miner-windows.zip) |
| Linux 64-bit   | [dilithium-miner-linux.zip](./dilithium-miner-linux.zip) |

## Quick start

Replace `POOL_HOST`, `YOUR_WALLET`, and thread count.

**Windows** — edit `mine-pool.bat`, then double-click it.

**Linux** — edit `mine-pool.sh`, then:

```bash
chmod +x dilithium-miner mine-pool.sh
./mine-pool.sh
```

**Example (manual):**

```bash
./dilithium-miner --pool 144.91.105.244:3333 --miner=YOUR_WALLET_ADDRESS --threads 4
```

- `--miner` = **your** payout address (not the pool operator wallet)
- Use the **patched** binary from this release only

## Pool connection

| Setting | Example |
|---------|---------|
| Stratum | `144.91.105.244:3333` |
| Dashboard | http://144.91.105.244/dashboard/ |

## What was fixed

1. Uses pool-provided timestamp and transactions (deterministic work)
2. Computes MerkleRoot for hashing after block 6000
3. Submits shares/blocks that match the pool template

## Source

Based on [luccadimario/dilithiumcoin](https://github.com/luccadimario/dilithiumcoin) with patches in `cmd/dilithium-miner/pool_worker.go`.

## License

Same as upstream Dilithiumcoin project.
