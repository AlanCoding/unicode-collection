# -*- coding: utf-8 -*-

DOCUMENTATION = r'''
    name: Make DRAGON host
    plugin_type: inventory
    author:
      - Alan Rominger (@AlanCoding)
    short_description: Makes one host which is the dragon unicode.
    version_added: "2.10"
    description:
        - Makes a dragon, specifically a unicode dragon. Nothing else.
    options:
        dragon:
            description: Do you want a dragon. Yes. I will ignore your answer.
            type: bool
            required: False
            default: True
'''

EXAMPLES = r'''
plugin: dragon.dragon.dragon
dragon: true
'''
from ansible.plugins.inventory import BaseInventoryPlugin


class InventoryModule(BaseInventoryPlugin):

    NAME = 'dragon.dragon.dragon'

    def parse(self, inventory, loader, path, cache=True):
        inventory.add_host('🐉')
