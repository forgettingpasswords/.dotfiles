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
        'l': 'enter-mode insert',
        'n': 'scroll down',
        'p': 'reload',
        'r': None,
        't': 'hint'
    }
}

c.content.print_element_backgrounds = False
c.hints.chars = 'arstdhneio'
c.editor.command = ['emacsclient', '-c', '{}']
c.url.searchengines = {
    "DEFAULT": "https://www.google.com/search?hl&q={}",
    "duck": "https://duckduckgo.com/?q={}"
}

exec(open('/home/bmiww/.config/qutebrowser/nord-qutebrowser.py').read())
