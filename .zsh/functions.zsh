# ===== Git関連の関数 =====
# 1週間のコミットログを表示
weeklog() {
  tig --all --author="$(git config user.email)" --since="7 days ago"
}

# TODOを含むコミットを表示
todolog() {
  tig --all --author="$(git config user.email)" -G"TODO"
}

# ===== fzf関連の関数 =====
# ファイルをfzfで検索してopen
function fzf_open() {
  local file
  file=$(fd --hidden --follow --exclude .git | fzf --height 10 --reverse --inline-info)  
  if [[ -n "$file" ]]; then
    LBUFFER="open $file"
  fi
  zle reset-prompt
}

# PRをfzfで検索してブラウザで開く
fpr() {
  target_json=$(gh pr list --json "number,title,author,updatedAt" | jq '.[].updatedAt |= (now - (. | fromdateiso8601) |
  if . < 60 then "less than a minute ago"
  elif . < 120 then "1 minute ago"
  elif . < 2700 then "\(. / 60 | floor) minutes ago"
  elif . < 5400 then "1 hour ago"
  elif . < 86400 then "\(. / 3600 | floor) hours ago"
  elif . < 172800 then "1 day ago"
  elif . < 2592000 then "\(. / 86400 | floor) days ago"
  elif . < 5184000 then "1 month ago"
  elif . < 31557600 then "\(. / 2592000 | floor) months ago"
  elif . < 63115200 then "1 year ago"
  else "over \(. / 31557600 | floor) years ago" end)')

  pull_requests=$(echo $target_json | jq -r '.[] | "#\(.number)\t\(.title)\t\(.author.login)\t\(.updatedAt)"' | column -t -s$'\t')
  echo $pull_requests | fzf --height 10 --inline-info --reverse | awk '{print $1}' | xargs gh pr view --web
}
