-- Specify the resource manifest
fx_version 'cerulean'
games { 'gta5' }

files {
    'stream/nopixel.rpf',
    'stream/nopixel-desert-grass.rpf',
    'stream/nopixel-extra-vegetation.rpf',
    'stream/nopixel-light-addons.rpf'
    -- Add more RPF files as needed
}

-- Ensure that the RPF files are loaded on the client-side
data_file 'DLC_ITYP_REQUEST' 'stream/nopixel.rpf'
data_file 'DLC_ITYP_REQUEST' 'stream/nopixel-desert-grass.rpf'
data_file 'DLC_ITYP_REQUEST' 'stream/nopixel-extra-vegetation.rpf'
data_file 'DLC_ITYP_REQUEST' 'stream/nopixel-light-addons.rpf'
-- Add more data_file entries for each RPF file