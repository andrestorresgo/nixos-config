{ pkgs, ... }: {
  home.packages = with pkgs; [
    # PostgreSQL and related tools
    postgresql_15
    postgis
    pgadmin4
    pg_top
    
    # Database management and backup tools
    pgcli      # Command-line PostgreSQL interface
  ];

  # Optional: Add PostgreSQL-specific aliases
  programs.zsh.shellAliases = {
    pgstart = "pg_ctl start";
    pgstop = "pg_ctl stop";
    pgstatus = "pg_ctl status";
  };

  # Optional: PostgreSQL environment variables
  home.sessionVariables = {
    PGDATA = "$HOME/postgres_data";
    PGHOST = "localhost";
  };
}