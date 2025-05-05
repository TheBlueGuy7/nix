function upd --wraps='nix flake update ~/nix' --description 'alias upd nix flake update ~/nix'
  nix flake update ~/nix $argv
        
end
