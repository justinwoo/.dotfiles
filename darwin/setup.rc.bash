if [[ $MACOS ]]
then
  export PATH="/opt/homebrew/bin:$PATH"
fi

# stupid fucking apple
alias unfuck-quarantine='xattr -d com.apple.quarantine'
