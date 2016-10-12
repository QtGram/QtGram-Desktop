.pragma library

function fallbackText(title) {
    var words = title.split(" ");

    if(words.length >= 2)
        return words[0].slice(0, 1).toUpperCase() + words[1].slice(0, 1).toUpperCase();

    return words[0][0].toUpperCase();
}

function firstMessageLine(message) {
    return message.split("\n")[0];
}
