# MTH3340 — Getting a working Julia environment

Do this **before** the Julia session if you can (it takes ~15 minutes plus downloads). Bring your laptop either way — we will walk through it at the start.

## 1. Install Julia (via juliaup)

`juliaup` is the official installer/version manager (the Julia analogue of `pyenv`).

- **macOS / Linux**: open a terminal and run
  ```
  curl -fsSL https://install.julialang.org | sh
  ```
  (macOS alternative: `brew install juliaup`)
- **Windows**: open a terminal and run
  ```
  winget install julia -s msstore
  ```

Then open a new terminal and check `julia --version` (we use Julia ≥ 1.10). No admin rights needed — it installs in your user folder.

## 2. VS Code + the Julia extension

1. Install [VS Code](https://code.visualstudio.com).
2. In VS Code, open the Extensions panel and install **Julia** (by *julialang*).
3. Open any `.jl` file. `Shift+Enter` runs the current line/block in an integrated REPL; `Ctrl/Cmd+Shift+P → "Julia: Execute File"` runs the whole file.

## 3. Meet the REPL (the `julia` prompt)

The REPL has four modes — you switch with a single keystroke at an empty prompt:

| Key | Mode | Use |
|---|---|---|
| (none) | `julia>` | run code |
| `]` | `pkg>` | install/manage packages |
| `?` | `help?>` | documentation, e.g. `?sort` |
| `;` | `shell>` | shell commands |

`Backspace` returns to `julia>`.

## 4. Environments (the analogue of Python virtualenvs)

Every project should carry its own environment, recorded in `Project.toml` (direct dependencies) and `Manifest.toml` (exact versions — full reproducibility):

```
cd my-project
julia --project=.
]                     # enter pkg mode
add Plots             # install into THIS project
status                # list the project's packages
```

To reproduce someone else's project (e.g. this course's material): `julia --project=.` then `] instantiate`.

## 5. Pluto notebooks

```
julia
] add Pluto           # once
using Pluto
Pluto.run()           # opens your browser
```

Then open `01-julia-for-pythonistas.jl` from the Pluto welcome page. Pluto notebooks are **reactive**: editing a cell re-runs everything that depends on it. Pluto also manages packages for you — the first time you open a notebook that `using`s a package, it installs it (the first `Plots` install takes a few minutes; be patient).

## 6. Plan B: the `-vsc.jl` scripts

Every notebook has a matching plain script (`01-...-vsc.jl`, etc.) with the narrative as comments. Open it in VS Code and step through with `Shift+Enter`. Same content, no Pluto required.

## Links

- Official docs: <https://docs.julialang.org>
- The tutorial this session is based on: <https://www.matecdev.com/posts/julia-tutorial-science-engineering.html>
- Ask for help: <https://discourse.julialang.org>
