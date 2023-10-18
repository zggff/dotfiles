local wezterm = require("wezterm")
local act = wezterm.action

wezterm.on("window-config-reloaded", function(window, _)
    local overrides = window:get_config_overrides() or {}
    local appearance = window:get_appearance()
    local scheme = SchemeForAppearance(appearance)
    if overrides.color_scheme ~= scheme then
        overrides.color_scheme = scheme
        window:set_config_overrides(overrides)
    end
end)

wezterm.on('toggle_ligatures', function(window, _)
    local overrides = window:get_config_overrides() or {}
    wezterm.log_info(overrides.use_fancy_tab_bar)
    if not overrides.harfbuzz_features then
        overrides.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
    else
        overrides.harfbuzz_features = nil
    end
    window:set_config_overrides(overrides)
end)

local dark_theme  = 'Catppuccin Mocha'
local light_theme = 'Catppuccin Latte'

-- local dark_theme  = 'Rosé Pine (base16)'
-- local dark_theme  = 'rose-pine-moon'
-- local dark_theme  = 'Rosé Pine Moon (base16)'
-- local light_theme = 'Rosé Pine Dawn (base16)'
-- local light_theme = 'rose-pine-dawn'


function SchemeForAppearance(appearance)
    if appearance:find 'Dark' then
        return dark_theme
    else
        return light_theme
    end
end

local config = {
    default_prog = { "/bin/zsh", "-l" },
    font = wezterm.font_with_fallback({
        "Cascadia Code",
        "CaskaydiaCove Nerd Font",
        "Noto Emoji",
        "Noto Color Emoji",
        "FontAwesome"
    }),
    use_fancy_tab_bar = false,
    font_size = 18.0,
    enable_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    exit_behavior = "Close",
    keys = {
        {
            key = "d",
            mods = "CMD",
            action = act.SplitHorizontal,
        },
        {
            key = "d",
            mods = "CMD | SHIFT",
            action = act.SplitVertical,
        },
        {
            key = "t",
            mods = "CMD",
            action = act.SpawnTab 'CurrentPaneDomain'
        },
        {
            key = "LeftArrow",
            mods = "CMD",
            action = act.ActivateTabRelative(-1)
        },
        {
            key = "RightArrow",
            mods = "CMD",
            action = act.ActivateTabRelative(1)
        },
        {
            key = "p",
            mods = "CMD",
            action = act.EmitEvent 'toggle_ligatures'
        },
        {
            key = "h",
            mods = "CMD",
            action = act.ActivatePaneDirection("Left")
        },
        {
            key = "l",
            mods = "CMD",
            action = act.ActivatePaneDirection("Right")
        },
        {
            key = "j",
            mods = "CMD",
            action = act.ActivatePaneDirection("Down")
        },
        {
            key = "k",
            mods = "CMD",
            action = act.ActivatePaneDirection("Up")
        }
    },

    inactive_pane_hsb = {
        saturation = 1,
        brightness = 1,
    },
    window_padding = {
        left = "0cell",
        right = "0cell",
        top = "0cell",
        bottom = "0cell",
    },
}

return config
--
--
-- keys_zellij = {
--     {
--         key = "d",
--         mods = "CMD",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "%" },
--         }
--     },
--     {
--         key = "d",
--         mods = "CMD | SHIFT",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = '"' },
--         }
--     },
--     {
--         key = "t",
--         mods = "CMD",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "c" },
--         }
--     },
--     {
--         key = "LeftArrow",
--         mods = "CMD",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "p" },
--         }
--     },
--     {
--         key = "RightArrow",
--         mods = "CMD",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "n" },
--         }
--     },
--
--     {
--         key = "l",
--         mods = "CMD",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "l", mods = "CTRL" }
--         }
--     },
--     {
--         key = "Enter",
--         mods = "CMD",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "z" }
--         }
--
--     },
--     {
--         key = "w",
--         mods = "CMD",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "x" }
--         }
--
--     },
--     {
--         key = "F3",
--         action = act.Multiple {
--             act.SendKey { key = "b", mods = "CTRL" },
--             act.SendKey { key = "w" }
--         }
--     },
--     {
--         key = "q",
--         mods = "CMD",
--         action = act.CloseCurrentTab { confirm = true }
--     },
--     {
--         key = "Enter",
--         mods = "ALT",
--         action = act.SendKey { key = "Enter", mods = "ALT" }
--     }
-- },
