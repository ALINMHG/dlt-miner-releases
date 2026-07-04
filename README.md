# Dilithium Pool Miner (patched)

Patched `dilithium-miner` for mining on **public Stratum pools** after the MerkleRoot fork (block 6000+).

Required for pools that send deterministic work (fixed timestamp, Merkle root, coinbase). The official miner from GitHub **will not** find valid blocks on these pools.

## Downloads

| Platform | File |
|----------|------|
| Windows 64-bit | [dilithium-miner-windows.zip](./dilithium-miner-windows.zip) |
| Linux 64-bit   | [dilithium-miner-linux.zip](./dilithium-miner-linux.zip) |

## Requirements

The miner is written in **Go** ([golang.org](https://go.dev/)).

| Use case | Go needed? |
|----------|------------|
| **Run** the pre-built ZIP from this repo | **No** — use `dilithium-miner.exe` (Windows) or `dilithium-miner` (Linux) as included |
| **Build** from source yourself | **Yes** — install [Go 1.21 or newer](https://go.dev/dl/), clone [dilithiumcoin](https://github.com/luccadimario/dilithiumcoin), apply the `pool_worker.go` patch, then `go build ./cmd/dilithium-miner` |

Do **not** use the unpatched official miner binary from upstream releases on MerkleRoot pools — it will not find valid blocks even with Go installed.

### Install Go on Linux (only if building from source)

Skip this if you use the pre-built `dilithium-miner` from the ZIP above.

**Ubuntu / Debian (64-bit):**

```bash
# Download and install Go (check https://go.dev/dl/ for the latest version)
wget https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz

# Add Go to PATH (current shell + future logins)
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

# Verify
go version
```

**Build the patched miner:**

```bash
git clone https://github.com/luccadimario/dilithiumcoin.git
cd dilithiumcoin
# Replace cmd/dilithium-miner/pool_worker.go with the patched version from this repo's source
go build -o dilithium-miner ./cmd/dilithium-miner
```

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
