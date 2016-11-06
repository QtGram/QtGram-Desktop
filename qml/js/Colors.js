.pragma library

var AVATARS = [
    "papayawhip",
    "black",
    "purple",
    "green",
    "yellow",
    "indianred",
    "brown",
    "olivedrab",
]

function getColor(userId) {
    return AVATARS[userId % 8];
}

