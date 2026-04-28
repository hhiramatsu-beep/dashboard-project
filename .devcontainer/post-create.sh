#!/bin/bash
set -e

echo "=== Installing Python dependencies ==="
pip install --upgrade pip
pip install \
  pandas polars numpy scipy \
  plotly altair streamlit \
  fastapi uvicorn[standard] \
  psycopg2-binary sqlalchemy \
  jupyterlab ipywidgets \
  python-dotenv httpx \
  pytest ruff

echo "=== Installing Claude Code CLI ==="
npm install -g @anthropic-ai/claude-code

echo "=== Setting up Claude Code ==="
mkdir -p .claude
cat > .claude/settings.json << 'EOF'
{
  "permissions": {
    "allow": [
      "Bash(pip:*)",
      "Bash(python:*)",
      "Bash(pytest:*)",
      "Bash(uvicorn:*)",
      "Bash(streamlit:*)",
      "Bash(jupyter:*)",
      "Bash(git:*)",
      "Bash(ruff:*)"
    ],
    "deny": []
  }
}
EOF

echo "=== Setup complete! ==="
echo "Claude Code: $(claude --version)"
