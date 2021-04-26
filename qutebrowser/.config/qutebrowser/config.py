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
    "DEFAULT": "https://www.google.com/search?hl&q={}",
    "duck": "https://duckduckgo.com/?q={}",
    "cardmarket": "https://www.cardmarket.com/en/Magic/Products/Search?searchString={}"
}

c.tabs.position = 'top'
c.tabs.show = 'switching'

c.fileselect.handler = "external"
c.fileselect.multiple_files.command = ["/home/toms/.local/bin/waitqutetemp", "choosefiles", "{}"]
c.fileselect.single_file.command = ["/home/toms/.local/bin/waitqutetemp", "choosefile", "{}"]

with config.pattern('*://app.slack.com/') as domainC:
    domainC.content.notifications = True

with open('/home/toms/.config/qutebrowser/nord-qutebrowser.py', 'r') as f:
    exec(f.read())

config.load_autoconfig()
