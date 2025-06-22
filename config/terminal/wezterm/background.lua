
local home = os.getenv( "HOME" )

local wpdis = home .. "/dotfiles/config/terminal/wezterm/.wp"
local f = io.open(wpdis, 'r')
local content = f:read('a')
f:close()

local flg = string.match(content,"[0-9]+")

if (flg == "0") then
    return {
        {
            source = {
                Color="black"
            },
            repeat_x = 'NoRepeat',
            hsb = {
                brightness = 0.04,
                saturation = 0.9,
            },
            attachment = {
                Parallax = 0,
            },
        }
    }
elseif (flg == "1") then
    return {
        {
            source = {
               File = home .. "/wallpapers/nightcity_4k.jpg"
            },
            repeat_x = 'NoRepeat',
            hsb = {
                brightness = 0.04,
                saturation = 0.9,
            },
            attachment = {
                Parallax = 0,
            },
        }
    }
elseif (flg == "2") then
    return {
        {
            source = {
               File = home .. "/wallpapers/white.png"
            },
            repeat_x = 'NoRepeat',
            hsb = {
                brightness = 0.15,
                saturation = 0.9,
            },
            attachment = {
                Parallax = 0,
            },
        }
    }
elseif (flg == "3") then
    return {
        {
            source = {
               File = home .. "/wallpapers/milky_girl.jpg"
            },
            repeat_x = 'NoRepeat',
            hsb = {
                brightness = 0.09,
                saturation = 0.9,
            },
            attachment = {
                Parallax = 0,
            },
        }
    }
elseif (flg == "4") then
    return {
        {
            source = {
               File = home .. "/wallpapers/butterfly_girl.jpg"
            },
            repeat_x = 'NoRepeat',
            hsb = {
                brightness = 0.10,
                saturation = 0.9,
            },
            attachment = {
                Parallax = 0,
            },
        }
    }
elseif (flg == "5") then
    return {
        {
            source = {
               File = home .. "/wallpapers/teen_girl.jpg"
            },
            repeat_x = 'NoRepeat',
            hsb = {
                brightness = 0.06,
                saturation = 0.9,
            },
            attachment = {
                Parallax = 0,
            },
        }
    }
else
    return {
        {
            source = {
               -- File = home .. "/wallpapers/emilia/1.jpg",
               -- File = home .. "/OneDrive/pictures/wallpapers/unknown1.jpg"
               File = home .. "/wallpapers/earth_sky.jpg"
            },
            repeat_x = 'NoRepeat',
            hsb = {
                brightness = 0.10,
                saturation = 0.9,
            },
            attachment = {
                Parallax = 0,
            },
        }
    }
end
