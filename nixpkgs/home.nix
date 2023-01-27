{ config, pkgs,... }:

let
  cutlass-nvim = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "cutlass-nvim";
    version = "2023-01-26";
    src = pkgs.fetchFromGitHub {
      owner = "gbprod";
      repo = "cutlass.nvim";
      rev = "31a2099627cd1ef8898f442ee6a58c7400111395";
      sha256 = "Bmf5qTLdCTOXbGMjVb4vsj6qkN4nL0LtmUwZF3rl0zc="; 
    };
    meta.homepage = "https://github.com/gbprod/cutlass.nvim";
  };
in
{
  home.username = "cme";
  home.homeDirectory = "/home/cme";
  home.stateVersion = "22.11";
  home.packages = with pkgs; [
    unzip
    tree
    htop
    curl
    wget
    gnumake
    cmake
    bat
    ripgrep
    fd
    bfs
    nodejs-18_x
    clang_14
    clang-tools
  ];

  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      w = "git status -s";
      d = "git diff";
      dc = "git diff --cached";
      l = "git lol";
      lg = "git lolg";
      hms = "home-manager switch";
    };
    bashrcExtra = ''
      source ~/.nix-profile/etc/profile.d/nix.sh
    '';
  };

  programs.exa = {
    enable = true;
    enableAliases = true;
  };

  programs.fzf = {
    enable = true;
  };

  programs.starship = { 
    enable = true;
    settings = {
      add_newline = true;
      cmd_duration = { 
        min_time = 100;
        format = "[$duration]($style) ";
      };
      package = {
        disabled = true;
      };
      git_status = {
        disabled = true;
      };
      git_branch = {
        style = "yellow";
        format = "[$symbol$branch]($style) ";
      };
      username = {
        disabled = true; 
      };
      container = {
        disabled = true;
      };
      hostname = {
        disabled = false;
        ssh_only = false;
        style = "green";
        format = "[$hostname]($style) ";
      };
      directory = {
        style = "blue";
        truncate_to_repo = false;
        format = "[$path]($style)[$read_only]($read_only_style) ";
        read_only = " 🔒";
      };
    };
  };

  programs.git = {
    enable = true;
    userName = "Cédric Meuter";
    userEmail = "cedric.meuter@gmail.com";
    aliases = {
      lol = "log --decorate --pretty=oneline --abbrev-commit --color";
      lolg = "log --graph --decorate --pretty=oneline --abbrev-commit --all --color";
      sub = "submodule update --init --recursive";
      progress = "commit -a --amend --reuse-message HEAD";
      wipe = "!git reset --hard HEAD; git clean -fd";
      undo = "reset HEAD^1";
    };
    delta = {
      enable = true;
      options = {
        "side-by-side" = true;
        "line-numbers" = true;
      };
    };
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      credential = {
        helper = "cache";
      };
    };
  };

  programs.tmux = {
    enable = true;
    extraConfig = ''
      # fix vim background color
      set -g default-terminal "screen-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      
      # bar on top
      set-option -g status-position top
      
      # number window starts at 1
      set -g base-index 1
      
      # basic green on black
      set-option -g status-justify left
      set-option -g status-left "  #{=28:session_name}  "
      set-option -g status-left-length 32
      set-option -g status-left-style "bold,fg=white"
      set -g status-right " #h "
      set-option -g status-style "bg=black,fg=#4ba64f"
      set-option -g window-status-current-format " #W "
      set-option -g window-status-current-style "bg=#4ba64f,fg=black"
      set-option -g window-status-format " #W "
      set-option -g window-status-separator " "
      set-option -g window-status-style ""
      
      # set mouse mode
      set -g mouse on
      
      # switch window using C-b C-j
      bind-key C-j display-popup -E "tmux list-windows -F \"#W\" | fzf | xargs tmux select-window -t"
      
      # avoid esc-whatever problems in vim
      set -g status-interval 0
    '';
  };

  programs.neovim = {
    enable = true;
    vimAlias = true;
    plugins = with pkgs.vimPlugins; [
      vim-nix
      nui-nvim
      plenary-nvim
      nvim-web-devicons
      neo-tree-nvim
      lualine-nvim
      noice-nvim
      dressing-nvim
      telescope-nvim
      telescope-fzf-native-nvim
      nvim-lastplace
      cutlass-nvim
    ];
  };
}
