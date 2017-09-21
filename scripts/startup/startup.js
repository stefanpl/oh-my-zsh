#!/usr/bin/env node
const cp = require('child_process');

let commands = [
    {
        command: '/opt/icq',
        testString: 'icq',
        initialized: false,
    },
	{
        command: 'subl',
        testString: 'sublime',
        whenRunning: 'wmctrl -r subl -t 0',
        initialized: false,
    },
    {
        command: 'slack',
        testString: 'slack',
        whenRunning: 'wmctrl -c slack',
        initialized: false,
    },
    {
        command: 'google-chrome --start-maximized',
        testString: 'new tab',
        whenRunning: 'wmctrl -r "new tab" -t 0',
        initialized: false,
    },
    {
        command: 'google-chrome --start-maximized --new-window https://coincap.io',
        whenRunning: 'wmctrl -r coincap -t 3',
        testString: 'coincap',
        initialized: false,
    },
    {
        command: 'terminator -e htop --title htop',
        whenRunning: [
            'wmctrl -r htop -t 1',
            'wmctrl -a htop',
            '$HOME/.oh-my-zsh/scripts/quicktile right'
        ],
        testString: 'htop',
        initialized: false,
    },
    {
        command: 'caja /home/stefan/music',
        whenRunning: [
            'wmctrl -r music -t 2',
            'wmctrl -a music',
            '$HOME/.oh-my-zsh/scripts/quicktile maximize',
            '$HOME/.oh-my-zsh/scripts/quicktile left',
        ],
        testString: 'music',
        initialized: false,
    },
    {
        command: 'terminator --title terminal --maximise',
        testString: 'terminal',
        whenRunning: 'wmctrl -r terminal -t 0',
        initialized: false,
    },
];

let finishingCommands = [
    'wmctrl -a terminal',
    'xdotool type "Startup finished. Let\'s go!" ; sleep 3 ; xdotool key ctrl+c ; xdotool key ctrl+l',
];

checkIfAnythingIsAlreadyRunning();
startAllApplications();
waitUntilWindowsAreOpen();


// Iterate all the teststrings. Nothing should be running.
function checkIfAnythingIsAlreadyRunning() {
    commands.forEach(function(command) {
        if (command.testString) {
            if (windowWithStringExists(command.testString)) {
                throw new Error(
                    'There already exists a window matching the string \''
                    +command.testString+'\'. Aborting.');
            }
        }
    });
}

function startAllApplications() {
    commands.forEach(function(command) {
       cp.exec(command.command + ' &');
    });
}

// Wait until everything is opened or a timeout reached.
// For every open window,
function waitUntilWindowsAreOpen() {
    let timeoutBetweenChecks = 500;
    let maximumTimeout = 20000;
    let maximumRuns = maximumTimeout / timeoutBetweenChecks;
    function checkRecursively(runCounter) {
        let atLeastOneWindowNotOpen = false;
        commands.forEach(function(command) {
            if (command.initialized) {
                return;
            }
            if (!command.testString) {
                command.initialized = true;
                return;
            }
            atLeastOneWindowNotOpen = true;
            if (windowWithStringExists(command.testString)) {
                // The window is open! Execute follow-up commands
                command.initialized = true;
                if (command.whenRunning) {
                    executeFollowUpCommands(command.whenRunning);
                }
            }
        });
        if (atLeastOneWindowNotOpen && runCounter <= maximumRuns) {
            setTimeout(function() {
                checkRecursively(++runCounter);
            }, timeoutBetweenChecks);
        } else {
            finishUp();
        }
    }
    checkRecursively(0);
}

function finishUp() {
    finishingCommands.forEach(function(command) {
        cp.exec(command);
    });
}

function executeFollowUpCommands(commandList) {
    if (!isArray(commandList)) {
        commandList = [commandList];
    }
    let hasError = false;
    commandList.forEach(function(command) {
        if (hasError) {
            return;
        }
        try {
            execute(command);
        } catch (e) {
            console.log('Error executing follow-up command');
            hasError = true;
        }
    });
}

// synchronously execute a process
function execute(command) {
    return cp.execSync(command).toString('utf8');
}

function isArray(variable) {
    return Object.prototype.toString.call( variable ) === '[object Array]';
}

// Check if there is a window matching the string
function windowWithStringExists(testString) {
    let command = 'wmctrl -l | grep -i "' + testString + '"';
    try {
        // A successful execution means at least one result
        execute(command);
        return true;
    } catch (e) {
        // Non-zero exit code means no result
        return false;
    }
}
