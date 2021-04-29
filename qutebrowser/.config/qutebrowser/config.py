from pathlib import Path
home = str(Path.home())

config.load_autoconfig()

youtubeAudioDownload = "spawn youtube-dl -o '~/Music/Unsorted/%(title)s.%(ext)s' --no-cache-dir --extract-audio '{url}'"
youtubePlaylistAudioDownload = "spawn youtube-dl -o '~/Music/Unsorted/%(title)s.%(ext)s' --no-cache-dir --extract-audio '{url}' --yes-playlist"

spawnYTDL = "spawn youtube-dl"
output = "-o '~/Music/Unsorted/%(title)s.%(ext)s'"
options = "--no-cache-dir --extract-audio"
playlist = "--yes-playlist"
url = "'{url}'"

def whiteSpaceJoin(baseOptions):
    return " ".join(baseOptions)

dlAudio = whiteSpaceJoin([spawnYTDL, output, options, url])
dlAudioPlaylist = whiteSpaceJoin([spawnYTDL, output, options, playlist, url])

c.bindings.commands = {
    'normal': {
        'D': 'tab-close',
        'E': 'tab-prev',
        'F': None,
        'I': 'forward',
        'K': 'search-prev',
        'L': None,
        'N': 'tab-next',
        'P': 'reload -f',
        'R': None,
        'T': 'hint all tab',
        'd': None,
        'e': 'scroll up',
        'f': None,
        'fe': 'open-editor',
        'da': dlAudio,
        'dA': dlAudioPlaylist,
        'i': 'scroll right',
        'k': 'search-next',
        'l': 'mode-enter insert',
        'n': 'scroll down',
        'p': 'reload',
        'r': None,
        't': 'hint',
        'zp': 'spawn --userscript qute-pass --password-only',
        'zf': 'spawn --userscript qute-pass',
        'zo': 'spawn --userscript qute-pass --otp-only',
        ',p': 'spawn --userscript run-yt-playlist',
        ',P': 'hint links spawn mpv --shuffle {hint-url}'
    }
}

c.content.print_element_backgrounds = False
c.hints.chars = 'arstdhneio'
c.editor.command = ['emacsclient', '-c', '{}']
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "google": "https://www.google.com/search?hl&q={}",
    "duck": "https://duckduckgo.com/?q={}",
    "cardmarket": "https://www.cardmarket.com/en/Magic/Products/Search?searchString={}"
}

c.tabs.position = 'top'
c.tabs.show = 'switching'

path_to_file_launcher = home + "/.config/qutebrowser/waitqutetemp"
c.fileselect.handler = "external"
c.fileselect.multiple_files.command = [path_to_file_launcher, "choosefiles", "{}"]
c.fileselect.single_file.command = [path_to_file_launcher, "choosefile", "{}"]

with config.pattern('*://app.slack.com/') as domainC:
    domainC.content.notifications.enabled = True

with open(home + '/.config/qutebrowser/nord-qutebrowser.py', 'r') as f:
    exec(f.read())

