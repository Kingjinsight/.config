#!/bin/sh
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // ""')
model=$(echo "$input" | jq -r '.model.display_name // ""')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
session=$(echo "$input" | jq -r '.session_name // ""')
vim_mode=$(echo "$input" | jq -r '.vim.mode // ""')

# Git branch (skip optional locks)
git_branch=""
if [ -d "$cwd/.git" ] || git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  git_branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
fi

time_str=$(date +%H:%M:%S)

dim='\033[2m'
reset='\033[0m'

parts=""

# Vim mode
if [ -n "$vim_mode" ]; then
  parts="${parts}${dim}[${vim_mode}]${reset}  "
fi

# Session
if [ -n "$session" ]; then
  parts="${parts}${dim}${session}${reset}  "
fi

# Directory
if [ -n "$cwd" ]; then
  short_cwd=$(echo "$cwd" | sed "s|^$HOME|~|")
  parts="${parts}${dim}${short_cwd}${reset}  "
fi

# Git branch
if [ -n "$git_branch" ]; then
  parts="${parts}${dim}(${git_branch})${reset}  "
fi

# Model
if [ -n "$model" ]; then
  parts="${parts}${dim}${model}${reset}  "
fi

# Context remaining
if [ -n "$remaining" ]; then
  parts="${parts}${dim}ctx:${remaining}%${reset}  "
fi

# Time
parts="${parts}${dim}${time_str}${reset}"

printf "%b" "$parts"
