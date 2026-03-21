c = c
config = config

import os
os.environ["QUTE_BIB_FILEPATH"] = "/home/j/org/unad/refs/qute.bib"

c.tabs.title.format = "{audio}{current_title}"

c.url.searchengines = {
# note - if you use duckduckgo, you can make use of its built in bangs, of which there are many! https://duckduckgo.com/bangs
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        '!aw': 'https://wiki.archlinux.org/?search={}',
        '!apkg': 'https://archlinux.org/packages/?sort=&q={}&maintainer=&flagged=',
        '!gh': 'https://github.com/search?o=desc&q={}&s=stars',
        '!yt': 'https://www.youtube.com/results?search_query={}',
        '!ytm': 'https://music.youtube.com/search?q={}',
        }

c.completion.open_categories = ['searchengines', 'quickmarks', 'bookmarks', 'history', 'filesystem']

config.load_autoconfig() # load settings done via the gui
c.auto_save.session = True # save tabs on quit/restart

# keybinding changes
config.bind('<Escape>', 'mode-leave ;; jseval -q document.activeElement.blur()', mode='insert')
# config.bind('<Ctrl-c>', 'mode-leave ;; jseval -q document.activeElement.blur()', mode='insert')
config.bind('=', 'cmd-set-text -s :open -t')
config.bind('t', 'open -t')
config.bind('<Ctrl-h>', 'tab-prev')
config.bind('<Ctrl-l>', 'tab-next')
c.confirm_quit = ['always']
# config.bind('o', 'set-cmd-text :open')
# config.bind('pc', 'set-cmd-text --append {clipboard}')
# config.bind('oc', 'open -t -- {clipboard}')
# config.bind('cc', 'hint images spawn sh -c "cliphist link {hint-url}"')
config.bind('cs', 'cmd-set-text -s :config-source')
# config.bind('tH', 'config-cycle tabs.show multiple never')
# config.bind('sH', 'config-cycle statusbar.show always never')
config.bind('T', 'hint links tab')
# config.bind('pP', 'open -- {primary}')
# config.bind('pp', 'open -- {clipboard}')
config.bind('pc', 'open -t -- {clipboard}')
config.bind('qm', 'macro-record')
config.bind('<ctrl-y>', 'spawn --userscript ytdl.sh')
config.bind('<ctrl-b>', 'spawn --userscript getbib')
# config.bind('tT', 'config-cycle tabs.position top left')
config.bind('gJ', 'tab-move +')
config.bind('dd', 'tab-close')
config.bind('gK', 'tab-move -')
config.bind('gm', 'tab-move')
config.bind(',t', 'config-cycle colors.webpage.darkmode.enabled true false')

# dark mode setup
c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.algorithm = 'lightness-cielab'
c.colors.webpage.darkmode.policy.images = 'never'
config.set('colors.webpage.darkmode.enabled', False, 'file://*')

#styles, comsetics
c.tabs.padding = {'top': 5, 'bottom': 5, 'left': 9, 'right': 9}
c.tabs.indicator.width = 0 # no tab indicators
# c.window.transparent = True # apparently not needed
c.tabs.width = '7%'

#fonts
c.fonts.default_family = ['JetBrains Mono Nerd Font']
c.fonts.default_size = '13pt'

c.fonts.web.family.standard = "default"
c.fonts.web.family.serif = "default"
c.fonts.web.family.sans_serif = "default"
c.fonts.web.family.fixed = "default"

# privacy (?
config.set("content.webgl", False, "*")
config.set("content.canvas_reading", False)
config.set("content.geolocation", False)
config.set("content.webrtc_ip_handling_policy", "default-public-interface-only")
config.set("content.cookies.accept", "all")
config.set("content.cookies.store", True)



c.content.blocking.enabled = True
