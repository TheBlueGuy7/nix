function rb --wraps='sudo nixos-rebuild switch --flake ~/nix' --description 'alias rb sudo nixos-rebuild switch --flake ~/nix'
  sudo nixos-rebuild switch --flake ~/nix $argv
        
end
