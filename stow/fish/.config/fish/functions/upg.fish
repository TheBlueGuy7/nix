function upg --wraps='sudo nixos-rebuild switch --upgrade --flake ~/nix' --description 'alias upg sudo nixos-rebuild switch --upgrade --flake ~/nix'
  sudo nixos-rebuild switch --upgrade --flake ~/nix $argv
        
end
