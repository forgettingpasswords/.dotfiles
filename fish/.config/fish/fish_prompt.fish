set -l nix_shell_info (
  if test -n "$IN_NIX_SHELL"
      echo -n "<nix> "
  end
)

echo -n -s "$nix_shell_info ~>"
