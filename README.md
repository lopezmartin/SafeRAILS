🚦 SafeRAILS

SafeRAILS is a local-first desktop application built with Electron, SvelteKit, and a microservice architecture communicating via NATS. It provides a modular platform for modeling, simulating, and validating safety cases using GSN (Goal Structuring Notation) — specifically tailored for urban rail systems.

🧱 Architecture Overview

SafeRAILS/
├── electron/                  # Electron main process
│   ├── main.ts               # Window creation
│   ├── preload.ts            # Secure bridge
├── frontend/                 # SvelteKit frontend
│   ├── src/
│   │   ├── lib/              # Business logic
│   │   ├── routes/           # UI components
│   ├── svelte.config.js
│   ├── tsconfig.json
├── microservices/            # NATS-based services
│   ├── gsn-service.ts
│   ├── simulation-service.ts
│   ├── validation-service.ts
│   ├── file-service.ts
├── package.json
├── tsconfig.json

⚙️ Setup Instructions

1. Initialize the project

mkdir saferails && cd saferails
npm init -y

2. Install dependencies

# Electron
npm install electron --save-dev

# SvelteKit
npm create svelte@latest frontend
cd frontend
npm install

# NATS client
npm install nats

# TypeScript (if not enabled)
npm install -D typescript

📦 JointJS Integration

SafeRAILS uses @joint/core to render interactive GSN diagrams.

Install JointJS

npm install @joint/core

Example usage in TypeScript

import { dia, shapes } from '@joint/core';

const graph = new dia.Graph();
const paper = new dia.Paper({ el, model: graph, width: 1000, height: 600 });

const goal = new shapes.standard.Rectangle();
goal.position(100, 100);
goal.resize(200, 80);
goal.attr({
  body: { fill: '#f88' },
  label: { text: 'Goal: Avoid signal overrun' }
});
goal.addTo(graph);

SvelteKit component

<script lang="ts">
  import { onMount } from 'svelte';
  import { createGSNGraph } from '$lib/gsn-visualizer';
  let container: HTMLDivElement;
  onMount(() => createGSNGraph(container));
</script>

<div bind:this={container} style="width:1000px; height:600px;"></div>

🧠 Microservices via NATS

Each service listens to a NATS subject:

gsn.create, gsn.update

simulation.run

validation.check

file.import, file.export

Frontend publishes messages via a shared NATS client (natsClient.ts).

📁 .gitignore

/node_modules/
/frontend/node_modules/
/dist/
/frontend/.svelte-kit/
/frontend/build/
.DS_Store
*.log
*.env

🧩 Next Steps

Add drag-and-drop editing to GSN visualizer

Connect simulation and validation services

Export safety cases as JSON or PDF

Package Electron app for distribution

📜 License

MIT — © Miguel, 2025