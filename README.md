# Nightfall — a personal almanac

A private nightly journal, built as a single self-contained page on the
SUPASMART design library: daily checkpoints you tick off, seven short
questions, a health check, and one long reflection. An archive heat-grid,
patterns (streaks, sparklines, word cloud, logbook), and a Sunday weekly
review. Installable as a PWA; works offline after first load.

## Where your data lives

Entries are saved to your browser's localStorage as you type — no account,
no server, nothing leaves your device. That also means **one copy, per
browser, per device**: use **Data → Download backup** regularly, and
**Data → Import backup** to move between devices. Markdown export writes a
single greppable journal file.

## Run

Open `index.html`, or serve statically (any host). Service worker requires http(s).

Fonts: Inter and Bebas Neue, self-hosted under their SIL OFL licenses
(`assets/fonts/*-OFL.txt`).
