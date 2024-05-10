{
   description = "A devbox shell";

   inputs = {
     nixpkgs.url = "github:NixOS/nixpkgs/75a52265bda7fd25e06e3a67dee3f0354e73243c";
   };

   outputs = {
     self,
     nixpkgs,
   }:
      let
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      {
        devShells.x86_64-linux.default = pkgs.mkShell {
          buildInputs = [
            (builtins.trace "downloading git@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/apl2ibxqrxbbj6z79nfgv892999z1zyv-git-2.44.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading htop@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/kzgs53ldwniiinwj8r07kcbl0cq64q1c-htop-3.3.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading fzf@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/z032xi5hmw4wsmkzajxavj73ywyh1as7-fzf-0.51.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading fzf@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/34bkla99r4a7gan5wha7ssrjs6dd3bzr-fzf-0.51.0-man";
              inputAddressed = true;
            }))
            (builtins.trace "downloading ripgrep@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/mnprkpiv9bilam2hfsi1n43sdydq0j21-ripgrep-14.1.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading jq@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/cbgw9mvxl7s93l700xwr71syg1ppbs5l-jq-1.7.1-bin";
              inputAddressed = true;
            }))
            (builtins.trace "downloading jq@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/fh2pylnsv887ycj0spvr7vl3622ydyx7-jq-1.7.1-man";
              inputAddressed = true;
            }))
            (builtins.trace "downloading yq@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/k58r09rfyaspq2ba32ng0irw09cpf8nh-python3.11-yq-3.4.3";
              inputAddressed = true;
            }))
            (builtins.trace "downloading neovim@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/dr53sp25hyfsnzjpm8mh3r3y36vrw3ng-neovim-0.9.5";
              inputAddressed = true;
            }))
            (builtins.trace "downloading btop@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/afiyrw6javwvwg692j8vaij3ghnap0h3-btop-1.3.2";
              inputAddressed = true;
            }))
            (builtins.trace "downloading cheat@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/q88pzxz9kq3a16q3ihccrn9bplzjjh7s-cheat-4.4.2";
              inputAddressed = true;
            }))
            (builtins.trace "downloading tree-sitter@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/0xqx8a9r8fyasrl35zg5j4dz6f7s6vfr-tree-sitter-0.22.5";
              inputAddressed = true;
            }))
            (builtins.trace "downloading nodejs@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/nx76dx71yjni4bajdn9pshxqs38lkj29-nodejs-22.0.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading python3Full@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/xzn1zm4ys3njhb6h9v7g2kyaviy1nc88-python3-3.11.9";
              inputAddressed = true;
            }))
            (builtins.trace "downloading eza@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/sb33b4iyrs9cl3swgs56dm96ah9nwsgr-eza-0.18.14";
              inputAddressed = true;
            }))
            (builtins.trace "downloading eza@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/j9l6gq3ibrmpgy1pqn38b6x7jx90x98j-eza-0.18.14-man";
              inputAddressed = true;
            }))
            (builtins.trace "downloading bat@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/8iafkixj71qgpkiwp1alwsf3y10g50mi-bat-0.24.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading atuin@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/f851b3gi87y9jcr0fcb0w5c9qk0sn139-atuin-18.2.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading zoxide@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/3700p9y6njzsskar98l8rkdjj3i0qs5j-zoxide-0.9.4";
              inputAddressed = true;
            }))
            (builtins.trace "downloading direnv@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/vgsya11phi7cs65kn4nmv7hyhjavhn1p-direnv-2.34.0";
              inputAddressed = true;
            }))
            (builtins.trace "downloading starship@latest" (builtins.fetchClosure {
              fromStore = "https://cache.nixos.org";
              fromPath = "/nix/store/kcvvk2jbqkdqvvsqmhnrznsm3azkd9yh-starship-1.18.2";
              inputAddressed = true;
            }))
          ];
        };
      };
 }
