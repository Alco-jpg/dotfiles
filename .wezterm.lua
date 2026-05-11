local wezterm = require("wezterm")
local mux = wezterm.mux
local config = wezterm.config_builder()

config.enable_wayland = false
config.font = wezterm.font("JetBrains Mono")
config.font_size = 15
-- config.font_size = 19
config.enable_tab_bar = false
-- config.window_background_opacity = 0.9
config.window_background_opacity = 0.7
config.text_background_opacity = 1.0

-- Configuration for your projects
local projects = {
    {
        name = "hub",
        path = "/home/jordyw/projects/rp/frontends/hub-frontend",
        nvim = true,
        tab2_cmd = "npm run turbo-serv",
    },
    {
        name = "lead-gen",
        path = "/home/jordyw/projects/rp/frontends/lead-gen",
        nvim = true,
        tab2_cmd = "npm run dev-serv",
    },
    {
        name = "lead-gen-ui",
        path = "/home/jordyw/projects/rp/frontends/lead-gen-ui",
        nvim = true,
    },
}

-- 1. Function to build/rebuild the Workspaces
local function setup_rp_workspaces()
    local existing_workspaces = {}
    for _, name in ipairs(mux.get_workspace_names()) do
        existing_workspaces[name] = true
    end

    for _, p in ipairs(projects) do
        if not existing_workspaces[p.name] then
            -- Create the window and the FIRST tab (Nvim or shell)
            local first_tab, first_pane, window = mux.spawn_window({
                workspace = p.name,
                cwd = p.path,
                args = p.nvim and { "nvim", "." } or nil,
            })

            -- Create Tab 2 (Terminal + Optional Command)
            local tab2, tab2_pane, _ = window:spawn_tab({ cwd = p.path })
            if p.tab2_cmd then
                -- This "types" the command into the shell so it stays open after Ctrl+C
                wezterm.sleep_ms(100)
                tab2_pane:send_text(p.tab2_cmd .. "\n")
            end

            -- Create Tab 3 (Clean terminal)
            window:spawn_tab({ cwd = p.path })

            -- Focus back to the first tab
            first_tab:activate()
        end
    end

    mux.set_active_workspace("hub")
end

config.keys = {
    -- [INIT] CTRL + SHIFT + R
    {
        key = "R",
        mods = "CTRL|SHIFT",
        action = wezterm.action_callback(function(window, pane)
            setup_rp_workspaces()
        end),
    },
    {
        key = "1",
        mods = "CTRL|ALT",
        action = wezterm.action_callback(function(window, pane)
            window:perform_action(wezterm.action.SwitchToWorkspace({ name = "hub" }), pane)
        end),
    },
    {
        key = "2",
        mods = "CTRL|ALT",
        action = wezterm.action_callback(function(window, pane)
            window:perform_action(wezterm.action.SwitchToWorkspace({ name = "lead-gen" }), pane)
        end),
    },
    {
        key = "3",
        mods = "CTRL|ALT",
        action = wezterm.action_callback(function(window, pane)
            window:perform_action(wezterm.action.SwitchToWorkspace({ name = "lead-gen-ui" }), pane)
        end),
    },
}

return config
