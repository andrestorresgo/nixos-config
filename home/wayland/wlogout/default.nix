{ config, ... }:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "sleep 1; echo 'Lock placeholder'";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "sleep 1; hyprctl dispatch exit";
        text = "Exit";
        keybind = "e";
      }
      {
        label = "suspend";
        action = "sleep 1; systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "hibernate";
        action = "sleep 1; systemctl hibernate";
        text = "Hibernate";
        keybind = "h";
      }
      {
        label = "reboot";
        action = "sleep 1; systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
      {
        label = "shutdown";
        action = "sleep 1; systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
    ];
    style = # css
      ''
        * {
          font-family: "JetBrainsMono NF", FontAwesome, sans-serif;
        	background-image: none;
        	transition: 20ms;
        }
        window {
        	background-color: rgba(25, 23, 36, 0.1);
        }
        button {
        	color: #e0def4;
          font-size: 14px;
          background-repeat: no-repeat;
        	background-position: center;
        	background-size: 25%;
        	border-style: solid;
        	background-color: rgba(31, 29, 46, 0.3);
        	border: 3px solid #908caa;
          box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
          margin: 10px;
          border-radius: 20px;
        }
        button:focus,
        button:active,
        button:hover {
          color: #9ccfd8;
          background-color: rgba(38, 35, 58, 0.5);
          border: 3px solid #31748f;
        }
        #lock {
          margin: 10px;
          border-radius: 20px;
          background-image: image(url("${config.home.homeDirectory}/.config/wlogout/icons/lock.png"));
        }
        #logout {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("${config.home.homeDirectory}/.config/wlogout/icons/logout.png"));
        }
        #suspend {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("${config.home.homeDirectory}/.config/wlogout/icons/suspend.png"));
        }
        #hibernate {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("${config.home.homeDirectory}/.config/wlogout/icons/hibernate.png"));
        }
        #reboot {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("${config.home.homeDirectory}/.config/wlogout/icons/reboot.png"));
        }
        #shutdown {
        	margin: 10px;
        	border-radius: 20px;
        	background-image: image(url("${config.home.homeDirectory}/.config/wlogout/icons/shutdown.png"));
        }
      '';
  };

  home.file.".config/wlogout/icons" = {
    source = ./icons;
    recursive = true;
  };
}   