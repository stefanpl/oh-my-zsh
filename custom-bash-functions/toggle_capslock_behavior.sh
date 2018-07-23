#!/bin/bash

# Toggle capslock behavior between default (capslock) and "swap with escape key"

function toggle_capslock_behavior() {

  function check_if_setxkbmap_is_available() {
    setxkbmap -version > /dev/null || exitWithError \
    "setxkbmap does not seem to be installed, but is required for this script. Aborting."
  }

  function swap_behavior() {
    if setxkbmap -print | grep "capslock(swapescape)" > /dev/null 2>&1; then
      logInfo "Already swapped. Reverting to default behavior."
      setxkbmap -option
    else
      logInfo "Swapping escape and capslock now."
      setxkbmap -option "caps:swapescape"
    fi
  }

  check_if_setxkbmap_is_available
  swap_behavior
}
