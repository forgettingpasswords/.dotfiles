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

exec(open('/home/bmiww/.config/qutebrowser/nord-qutebrowser.py').read())
