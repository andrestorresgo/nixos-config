# home/programs/dunst/dunst.nix
# (Or wherever you decided to place it relative to your home.nix)

{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        width = 0;
        max_width = 400;
        offset = "20x10"; # Dunst expects geometry strings for offset
        
        progress_bar_min_width = 380;
        progress_bar_max_width = 380;
        progress_bar_corner_radius = 2;

        padding = 10;
        horizontal_padding = 10;
        frame_width = 2;
        gap_size = 3;
        font = "JetBrainsMono Nerd Font 10"; # Ensure this font is available on your system

        icon_theme = "rose-pine-icons"; # Make sure this icon theme is installed and available via Home Manager or system-wide
        enable_recursive_icon_lookup = true;
        corner_radius = 8; # Increased corner radius for a more rounded look (you can adjust this value)
        
        # Ensure markup is full for rich text formatting in urgency rules
        markup = "full";

        background = "#26233a";
        foreground = "#e0def4";

        # Default highlight color (can be overridden by urgency levels)
        highlight = "#f6c177"; # Using a prominent Rose Pine accent for general highlight
      };

      # SWAPPED: This is now the "normal" urgency color scheme
      urgency_low = {
        background = "#362e3c"; # Original normal background
        highlight = "#f6c177";  # Original normal highlight
        frame_color = "#f6c177"; # Original normal frame_color
        default_icon = "dialog-warning"; # Using the normal icon
        format = "<b><span foreground='#f6c177'>%s</span></b>\n%b";
      };

      # SWAPPED: This is now the "low" urgency color scheme
      urgency_normal = {
        background = "#26273d"; # Original low background
        highlight = "#31748f";  # Original low highlight
        frame_color = "#31748f"; # Original low frame_color
        default_icon = "dialog-information"; # Using the low icon
        format = "<b><span foreground='#31748f'>%s</span></b>\n%b";
      };

      urgency_critical = {
        background = "#35263d";
        highlight = "#eb6f92";
        frame_color = "#eb6f92";
        default_icon = "dialog-error";
        format = "<b><span foreground='#eb6f92'>%s</span></b>\n%b";
      };
    };
  };
}