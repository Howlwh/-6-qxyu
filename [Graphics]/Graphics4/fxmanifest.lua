-- Specify the resource manifest
fx_version 'cerulean'
games { 'gta5' }

files {
    'stream/*.xml',
    'stream/content/*.ymf',
    'stream/content/*..ydr',
    'stream/content/*.ymap',
    'stream/content/*.ytyp',
    'stream/content/*.ytd'
}