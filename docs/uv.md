#uv

uv is a fast Python package and project manager developed by Astral.

## Official references

- Documentation: https://docs.astral.sh/uv/
- Installation: https://docs.astral.sh/uv/getting-started/installation/
- Tools: https://docs.astral.sh/uv/concepts/tools/
- GitHub: https://github.com/astral-sh/uv

## Basic commands

```bash
uv --version
uv self update
````

Create a virtual environment:

```bash
uv venv
source .venv/bin/activate
```

Run a Python command in a managed environment:

```bash
uv run python --version
```

Initialize a project:

```bash
uv init
```

Add dependencies:

```bash
uv add requests
uv add numpy
```

Install project dependencies:

```bash
uv sync
```

Run a Python tool without installing it globally:

```bash
uvx ruff --version
```

## Notes

* uv can replace many common uses of pip, venv, pip-tools, and pipx.
* For this repository, uv belongs to the Developer Environment layer, not the Identity layer.
* In WSL/Ubuntu, uv installed by the standalone installer is placed under:



[1]: https://docs.astral.sh/uv/?utm_source=chatgpt.com "uv"
