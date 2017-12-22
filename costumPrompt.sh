function last_cmd_state {
  if [ "$1" == 0 ]; then
    echo "\[$(tput setaf 40)\]👍\[$(tput sgr0)\]"
  else
    if [ "$1" == 127 ]; then
      local meaning=" - Not found"
    fi
    echo "\[$(tput setaf 196)\]👎\\[\$1 "$meaning"\]\[$(tput sgr0)\]"
  fi
}

function list_background_tasks {
  local jobs_count=$(jobs | wc -l)
  local sessions=$(tmux list-sessions 2>/dev/null | wc -l)
  local job_info=""
  local session_info=""
  if [ ! "$jobs_count" == "0" ]; then
    job_info="[Jobs: ${jobs_count}]"
  fi
  if [ ! "$sessions" == "0" ]; then
    session_info="[TMux-Sessions: ${sessions}]"
  fi
  if [ ! "${job_info}${session_info}" == "0" ]; then
    echo " \[$(tput setaf 199)\]╟──\[$(tput sgr0)\]${job_info}${session_info}"
  fi
}

function show_user_info {
  echo "\[$(tput setaf 199)\]═╦═\[$(tput sgr0)\][\[$(tput setaf 21)\]\\u\[$(tput sgr0)\]@\[$(tput setaf 40)\]\\H::\\l\[$(tput sgr0)\]]═[\[$(tput setaf 118)\]\\t\[$(tput sgr0)\]]"
}

function show_location {
  echo " \[$(tput setaf 199)\]╟──\[$(tput sgr0)\][\\w]"
}

function last_line {
  echo " \[$(tput setaf 199)\]╙─⚧ \[$(tput sgr0)\]"
}

function _prompt_command {
  local status="$?"
  PS1="$(show_user_info)─[$(last_cmd_state $status)]\n$(list_background_tasks)\n$(show_location)\n$(last_line)"
}
