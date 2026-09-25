# Vault — Fault-Tolerant Distributed Object Storage

[![Vault CI](https://github.com/OWNER/REPOSITORY/actions/workflows/ci.yml/badge.svg)](https://github.com/OWNER/REPOSITORY/actions/workflows/ci.yml)
[![Tests](https://img.shields.io/badge/vitest-5%20passed-brightgreen.svg)]()
[![Replication](https://img.shields.io/badge/quorum-3x%20multi--node-cyan.svg)]()
[![Design](https://img.shields.io/badge/UI-Equilibrium%20Liquid%20Glass-blue.svg)]()

> **Vault is an autonomous, fault-tolerant distributed object storage system built for high-resilience benchmarks.**  
> It stores chunked data across physically isolated, failure-prone storage nodes and automatically maintains **3x replication quorums**, **cryptographic SHA-256 integrity**, and **zero-downtime read failover** under sudden hardware crashes and bit-rot corruption.

---

## ✨ Features at a Glance

- **3x Multi-Node Chunk Replication**: Automatically hashes every uploaded object with SHA-256 and replicates copies across independent physical storage node directories.
- **Transparent Read Failover**: If a node crashes, Vault automatically discovers surviving replicas and fulfills reads with zero downtime.
- **Autonomous Self-Healing**: Nodes emit continuous heartbeats. When a node goes offline, the coordinator declares an under-replicated condition and automatically replicates clean copies to spare nodes.
- **Cryptographic Bit-Rot Repair**: Background audits verify disk byte hashes against the manifest. Corrupted blocks are automatically hot-swapped from healthy nodes.
- **Equilibrium Liquid Glass Interface**: Minimalist mission control with an interactive 3D Three.js cluster constellation, fluid stardust cursor tracking, and instant failover verification.
- **Docker & Cloud Ready**: Production multi-stage `Dockerfile` and `docker-compose.yml` for 1-command deployment.

---

## 🏗️ Architecture

```text
                           CLIENT / BROWSER
                                  │
                                  ▼
               ┌──────────────────────────────────────┐
               │    Vault Coordinator Nexus (:4000)   │
               │  REST API • SSE Engine • Metadata    │
               └──────────────────┬───────────────────┘
                                  │
         ┌────────────────────────┼────────────────────────┐
         ▼                        ▼                        ▼
┌──────────────────┐     ┌──────────────────┐     ┌──────────────────┐
│  Storage Node 01 │     │  Storage Node 02 │     │  Storage Node 03 │
│  data/nodes/01/  │     │  data/nodes/02/  │     │  data/nodes/03/  │
│  [Chunk Replica] │     │  [Chunk Replica] │     │  [Chunk Replica] │
└──────────────────┘     └──────────────────┘     └──────────────────┘
         ▲                        ▲                        ▲
         └────────────────────────┼────────────────────────┘
                                  │
               ┌──────────────────┴───────────────────┐
               │   Autonomous Repair & Chaos Engine   │
               │  • Heartbeat Monitor (1.5s/3.5s)     │
               │  • SHA-256 Bit-Rot Scanner           │
               │  • Load Variance Rebalancer          │
               └──────────────────────────────────────┘
```

---

## 👥 Collaborator & Team Setup Guide

If you are joining this repository as a collaborator, follow these steps to get running in under 2 minutes:

### 1. Clone the Repository
```bash
git clone https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
cd YOUR_REPO_NAME
```

### 2. Install All Dependencies (Single Command)
```bash
npm run setup
```
*(Installs root, backend server, and frontend client dependencies).*

### 3. Run Development Cluster
```bash
# Terminal 1: Run the backend server with pre-built client
npm start

# Or run client with hot-module reload for frontend editing:
npm run dev:client
```
Open **`http://localhost:4000`** in your browser.

### 4. Run Automated Vitest Scenarios
```bash
npm test
```
All 5 fault-tolerance test suites will execute and verify replication, failover, self-healing, bit-rot repair, and dynamic rebalancing.

---

## 🛠️ Team Git Workflow Best Practices

To collaborate smoothly with your teammates without merge conflicts:

1. **Keep `main` stable**: Never push broken code directly to `main`.
2. **Work in feature branches**:
   ```bash
   git checkout -b feature/my-new-feature
   ```
3. **Commit often with clear messages**:
   ```bash
   git add .
   git commit -m "feat: enhance replication heartbeats"
   ```
4. **Push branch & create a Pull Request**:
   ```bash
   git push origin feature/my-new-feature
   ```
5. **Continuous Integration**: The included GitHub Actions workflow (`.github/workflows/ci.yml`) will automatically run tests and verify the build on every push and PR!

---

## 🐳 Running with Docker

You can also run the entire cluster in a container:

```bash
# Build and run with Docker Compose
docker compose up -d

# View live cluster logs
docker compose logs -f

# Stop cluster
docker compose down
```

---

## 📁 Repository Structure

```text
├── .github/workflows/ci.yml   # Automated GitHub Actions test & build pipeline
├── Dockerfile                 # Multi-stage production container
├── docker-compose.yml         # Containerized cluster setup
├── package.json               # Root scripts (setup, start, test, build)
├── client/                    # React 19 + TypeScript + Vite + Tailwind CSS v4
│   ├── src/components/        # LiquidNavbar, LiquidHero, ThreeClusterCanvas, etc.
│   └── src/api.ts             # API client & SSE real-time stream subscription
└── server/                    # Node.js + Express + TypeScript backend
    ├── src/cluster/           # NodeManager, StorageNode (heartbeats, disks)
    ├── src/metadata/          # MetadataManager (object manifests & chunk mappings)
    ├── src/engine/            # RepairEngine, IntegrityScanner, Rebalancer
    └── tests/vault.test.ts    # Comprehensive Vitest resilience test suite
```

---

## 📄 License
MIT © 2026 Sahith Reddy & Contributors.
