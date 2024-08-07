local obsidian = require("obsidian")

local base_options = obsidian.setup({
  -- Required, the path to your vault directory.
  dir = "/home/enrico/Documents/obsidian_vaults/notes",
  --dir = "/home/enrico/Documents/notes/",
  -- Optional, completion.
  completion = {
    -- If using nvim-cmp, otherwise set to false
    nvim_cmp = false,
    -- Trigger completion at 2 chars
    min_chars = 2,
    -- Where to put new notes created from completion. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
  },

  -- Optional, customize how names/IDs for new notes are created.
  new_notes_location = "current_dir",
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,

  -- Optional, set to true if you don't want Obsidian to manage frontmatter.
  disable_frontmatter = false,

  -- Optional, alternatively you can customize the frontmatter data.
  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,

  -- Optional, for templates (see below).
--  templates = {
--    subdir = "templates",
--    date_format = "%Y-%m-%d-%a",
--    time_format = "%H:%M",
--  },

  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
     vim.fn.jobstart({"xdg-open", url})  -- linux
  end,

  -- Optional, set to true if you use the Obsidian Advanced URI plugin.
  -- https://github.com/Vinzent03/obsidian-advanced-uri
  use_advanced_uri = true,

  -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = false,

  -- Optional, by default commands like `:ObsidianSearch` will attempt to use
  -- telescope.nvim, fzf-lua, and fzf.nvim (in that order), and use the
  -- first one they find. By setting this option to your preferred
  -- finder you can attempt it first. Note that if the specified finder
  -- is not installed, or if it the command does not support it, the
  -- remaining finders will be attempted in the original order.
  finder = "telescope.nvim",
})

local vault_dirs = {}
local vaults_dir = "~/Documents/obsidian_vaults"

for dir in vim.fs.dir(vaults_dir) do
	local path = vim.fn.expand(string.format("%s/%s", vaults_dir, dir))
	table.insert(vault_dirs, path)
end

local function configure_obsidian(vaults, options)
	local cwd = vim.fn.getcwd()
	local dirs = { cwd }
	local vault_dir = nil
	local vault_map = {}

	for _, dir in pairs(vaults) do
		vault_map[dir] = true
	end

	for x in vim.fs.parents(cwd) do
		table.insert(dirs, x)
	end

	for _, x in pairs(dirs) do
		local is_match = vault_map[x]

		if is_match then
			vault_dir = x
			break
		end
	end

	if vault_dir then
		local workspace_options = vim.tbl_extend("force", options, { dir = vault_dir })

		obsidian.setup(workspace_options)
	end
end

local au_group = vim.api.nvim_create_augroup("ObsidianAutogroup", { clear = true })

vim.api.nvim_create_autocmd("DirChanged", {
	pattern = "*",
	group = au_group,
	callback = function()
		configure_obsidian(vault_dirs, base_options)
	end,
	desc = "Re-initialises Obsidian when the working directory changes",
})

configure_obsidian(vault_dirs, base_options)

