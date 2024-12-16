{ pkgs, ... }: {
  home.packages = with pkgs; [
    # PHP and core extensions
    php83
    php83Packages.composer
    
    # Required PHP extensions for Laravel
    php83Extensions.pdo
    php83Packages.phpstan
    php83Extensions.pdo_pgsql
    php83Extensions.mbstring
    php83Extensions.tokenizer
    php83Extensions.xml
    php83Extensions.curl
    php83Extensions.fileinfo
    php83Extensions.openssl
    php83Extensions.zip
    # php83Extensions.json

    # Additional development tools
    phpPackages.php-cs-fixer
    phpPackages.psalm
  ];

  # Environment variables for Laravel
  home.sessionVariables = {
    PHP_IDE_CONFIG = "serverName=localhost";
    COMPOSER_HOME = "$HOME/.config/composer";
    PATH = "$HOME/.config/composer/vendor/bin:$PATH";
  };

  # Create required directories
  home.file.".config/composer/.keep".text = "";

  # Shell aliases for common Laravel commands
  programs.zsh.shellAliases = {
    art = "php artisan";
    sail = "./vendor/bin/sail";
    test = "php artisan test";
    tinker = "php artisan tinker";
  };
}